import 'package:intl/intl.dart';

class SerializationUtils {
  const SerializationUtils._();

  static int? parseInt(String? intString) {
    if (intString == null) {
      return null;
    }

    return int.tryParse(intString);
  }

  static DateTime? parseDate(String? dateString) {
    if (dateString == null) {
      return null;
    }

    return DateFormat(_defaultDateFormat).tryParse(dateString);
  }

  static const _defaultDateFormat = 'yyyy-MM-dd HH:mm:ss';
}
