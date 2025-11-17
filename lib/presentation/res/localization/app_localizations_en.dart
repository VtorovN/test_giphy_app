// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get retry => 'Retry';

  @override
  String get errorServerConnection => 'Server connection error';

  @override
  String errorWithCodeMessage(String code, String message) {
    return 'Error $code: $message';
  }

  @override
  String get errorUnknown => 'Unknown error';

  @override
  String get errorLoadingGifs => 'Error loading gifs';

  @override
  String get errorLoadingMoreGifs => 'Error loading more gifs';

  @override
  String get emptyNoGifsFound => 'No gifs found';

  @override
  String get titleGifDetails => 'GIF Details';

  @override
  String get gifUntitled => 'Untitled GIF';

  @override
  String get errorLoading => 'Loading error';

  @override
  String get dateUnknown => 'Unknown date';

  @override
  String metadataRating(String rating) {
    return 'Rating: $rating';
  }

  @override
  String metadataUploaded(String date) {
    return 'Uploaded: $date';
  }

  @override
  String get metadataLowContrast => 'Low contrast';
}
