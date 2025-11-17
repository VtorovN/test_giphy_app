import 'package:mockito/annotations.dart';
import 'package:test_giphy_app/domain/interactors/gif_interactor.dart';
import 'package:test_giphy_app/domain/repositories/gif_repository.dart';

@GenerateMocks([GifRepository, GifInteractor])
void main() {}
