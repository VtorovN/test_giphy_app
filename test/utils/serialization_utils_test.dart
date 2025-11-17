import 'package:flutter_test/flutter_test.dart';
import 'package:test_giphy_app/utils/serialization_utils.dart';

void main() {
  group(
    'SerializationUtils',
    () {
      group(
        'SerializationUtils.parseInt',
        () {
          test(
            'Returns null for null input',
            () {
              expect(SerializationUtils.parseInt(null), isNull);
            },
          );

          test('Parses valid integers', () {
            expect(SerializationUtils.parseInt('123'), equals(123));
            expect(SerializationUtils.parseInt('-42'), equals(-42));
          });

          test('Returns null for invalid integers', () {
            expect(SerializationUtils.parseInt('abc'), isNull);
            expect(SerializationUtils.parseInt('123.45'), isNull);
          });
        },
      );

      group(
        'SerializationUtils.parseDate',
        () {
          test('Returns null for null input', () {
            expect(SerializationUtils.parseDate(null), isNull);
          });

          test('Parses valid date string with expected format', () {
            final date = SerializationUtils.parseDate('2023-11-16 12:34:56');

            expect(date, isNotNull);
            expect(date!.year, equals(2023));
            expect(date.month, equals(11));
            expect(date.day, equals(16));
            expect(date.hour, equals(12));
            expect(date.minute, equals(34));
            expect(date.second, equals(56));
          });

          test('Returns null for invalid date string', () {
            expect(SerializationUtils.parseDate('16-11-2023'), isNull);
            expect(SerializationUtils.parseDate('not-a-date'), isNull);
          });
        },
      );
    },
  );
}
