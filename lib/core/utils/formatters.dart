import 'package:intl/intl.dart';

abstract final class AppDateFormatter {
  static final DateFormat _dayMonthYear = DateFormat('dd/MM/yyyy');

  static String formatDayMonthYear(DateTime date) => _dayMonthYear.format(date);
}

abstract final class AppCurrencyFormatter {
  static String formatAmount(num value) {
    final formatted = NumberFormat('#,##0', 'pt_BR')
        .format(value)
        .replaceAll('.', ' ');
    return '$formatted R\$';
  }

  static String formatMileage(num value, String unitLabel) {
    final formatted = NumberFormat('#,##0', 'pt_BR')
        .format(value)
        .replaceAll('.', ' ');
    return '$formatted $unitLabel';
  }
}
