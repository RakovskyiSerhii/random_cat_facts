import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static DateFormat get apiFormat => DateFormat('yyyy-MM-dd');

  static DateFormat get factFormat => DateFormat('dd.MM.yyyy');

  static String convertInAnotherFormat(
      String date, DateFormat input, DateFormat output) {
    final parsed = input.parse(date);
    return output.format(parsed);
  }
}
