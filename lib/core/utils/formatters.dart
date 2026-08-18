import 'package:intl/intl.dart';

abstract final class AppDateFormatter {
  static final DateFormat _dayMonthYear = DateFormat('dd/MM/yyyy');
  static final DateFormat _shortDayMonth = DateFormat('d MMM', 'pt_BR');
  static final DateFormat _monthYearHeader = DateFormat('MMMM yyyy', 'pt_BR');

  static String formatDayMonthYear(DateTime date) => _dayMonthYear.format(date);

  static String formatShortDayMonth(DateTime date) {
    return _shortDayMonth.format(date).replaceAll('.', '');
  }

  static String formatMonthYearHeader(DateTime date) {
    return _monthYearHeader.format(date).toUpperCase();
  }

  static String formatDaysUntil(DateTime targetDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(targetDate.year, targetDate.month, targetDate.day);
    final days = target.difference(today).inDays;

    if (days <= 0) {
      return 'Hoje';
    }

    if (days == 1) {
      return 'Em 1 dia';
    }

    return 'Em $days dias';
  }
}

abstract final class AppCurrencyFormatter {
  static String formatAmount(num value) {
    final formatted = NumberFormat('#,##0', 'pt_BR').format(value);
    return 'R\$ $formatted';
  }

  static String formatAmountWithCents(num value) {
    final formatted = NumberFormat('#,##0.00', 'pt_BR').format(value);
    return 'R\$ $formatted';
  }

  static String formatMileage(num value, String unitLabel) {
    final formatted = NumberFormat('#,##0', 'pt_BR')
        .format(value)
        .replaceAll('.', ' ');
    return '$formatted $unitLabel';
  }

  static double? parseAmount(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    final normalized = trimmed.replaceAll(' ', '').replaceAll('.', '').replaceAll(',', '.');
    return double.tryParse(normalized);
  }
}
