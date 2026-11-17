import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static final NumberFormat _inrFormat = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 2,
  );

  static final NumberFormat _compactInr = NumberFormat.compactCurrency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 1,
  );

  static String formatRupees(num amount) {
    return _inrFormat.format(amount);
  }

  static String formatCompact(num amount) {
    return _compactInr.format(amount);
  }

  static String formatPercent(num percent, {bool showSign = true}) {
    final prefix = (showSign && percent > 0) ? '+' : '';
    return '$prefix${percent.toStringAsFixed(2)}%';
  }
}
