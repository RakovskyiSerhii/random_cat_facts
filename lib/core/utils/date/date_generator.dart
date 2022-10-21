import 'dart:math';

import 'package:random_cat_facts/core/utils/date/date_format.dart';

const int firstYear = 1970;

/// generate a random date from 1970 to 2040
class DateGenerator {
  DateGenerator._();

  static String generate() {
    final year = firstYear + Random().nextInt(70);
    final month = Random().nextInt(12) + 1;
    final day = Random().nextInt(28) + 1;
    return DateFormatter.apiFormat.format(DateTime(year, month, day));
  }
}
