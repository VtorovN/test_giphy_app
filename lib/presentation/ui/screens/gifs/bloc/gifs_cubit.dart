import 'dart:async';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:test_giphy_app/domain/interactors/gif_interactor.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/presentation/ui/screens/gifs/bloc/gifs_state.dart';

@injectable
class GifsCubit extends Cubit<GifsState> {
  final GifInteractor _interactor;

  final pagingController = PagingController<int, Gif>(firstPageKey: 1);
  final searchController = TextEditingController();

  // Timer used to debounce search typing
  Timer? _searchDebounce;

  // Current load operation
  CancelableOperation<void>? _currentOperation;

  // Last applied search query
  String _lastQuery = '';

  GifsCubit(this._interactor) : super(const GifsInitial()) {
    pagingController.addPageRequestListener(_loadList);
    searchController.addListener(_searchListener);
  }

  void setAnimationMode(bool isEnabled) {
    emit(
      state.copyWith(isAnimationEnabled: isEnabled),
    );
  }

  Future<void> _searchListener() async {
    final query = searchController.text.trim();

    // Avoid refreshing for the same query.
    if (query == _lastQuery) {
      return;
    }

    _searchDebounce?.cancel();

    _searchDebounce = Timer(
      const Duration(milliseconds: _debounceMilliseconds),
      () {
        _currentOperation?.cancel();
        _lastQuery = query;
        pagingController.refresh();
      },
    );
  }

  Future<void> _loadList([int? pageKey]) async {
    // Cancel any previous operation
    _currentOperation?.cancel();

    final page = pageKey ?? pagingController.nextPageKey ?? 1;

    final operation = CancelableOperation.fromFuture(
      _makeCancellablePageRequest(page),
    );

    _currentOperation = operation;

    try {
      await operation.value;
    } catch (e) {
      // Ignore errors from canceled operations
      if (operation.isCanceled) {
        return;
      }

      final errorObject = switch (e) {
        DioException(:Object error) => error,
        _ => e,
      };

      pagingController.error = errorObject;

      emit(
        GifsError(
          error: errorObject,
        ),
      );
    } finally {
      if (_currentOperation == operation) {
        _currentOperation = null;
      }
    }
  }

  Future<void> _makeCancellablePageRequest(int page) async {
    // Screen counts as loaded after first page is loaded
    if (page == 1) {
      emit(const GifsLoading());
    }

    final gifs = await _interactor.getGifList(
      searchQuery: searchController.text,
      page: page,
      pageSize: _pageSize,
    );

    final isLastPage = gifs.length < _pageSize || gifs.isEmpty;

    if (isLastPage) {
      pagingController.appendLastPage(gifs);
    } else {
      pagingController.appendPage(
        gifs,
        page + 1,
      );
    }

    emit(
      GifsLoaded(
        gifs: pagingController.itemList ?? [],
        isAnimationEnabled: state.isAnimationEnabled,
      ),
    );
  }

  @override
  Future<void> close() async {
    _searchDebounce?.cancel();
    await _currentOperation?.cancel();
    searchController.dispose();
    pagingController.dispose();

    return super.close();
  }

  static const int _pageSize = 20;
  static const int _debounceMilliseconds = 500;
}
