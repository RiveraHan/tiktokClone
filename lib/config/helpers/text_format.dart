import 'package:intl/intl.dart';

class TextFormats {
  static String humanReadableNumber(int number) {
    return NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
        .format(number);
  }
}
