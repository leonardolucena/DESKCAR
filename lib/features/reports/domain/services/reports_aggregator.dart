import 'package:deskcar/features/reports/domain/entities/reports_data.dart';
import 'package:deskcar/features/reports/domain/entities/reports_expense_bucket.dart';
import 'package:deskcar/features/reports/domain/entities/reports_summary.dart';
import 'package:deskcar/features/reports/domain/entities/reports_period.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';

abstract final class ReportsMonthFormatter {
  static const _labels = [
    'jan',
    'fev',
    'mar',
    'abr',
    'mai',
    'jun',
    'jul',
    'ago',
    'set',
    'out',
    'nov',
    'dez',
  ];

  static String label(DateTime month) {
    return '${_labels[month.month - 1]} ${month.year % 100}';
  }
}

abstract final class ReportsAggregator {
  static ReportsData aggregate({
    required List<ServiceRecordEntity> records,
    required ReportsPeriod period,
    DateTime? now,
  }) {
    final reference = now ?? DateTime.now();
    final periodStart = _periodStart(period, reference);
    final periodEnd = DateTime(reference.year, reference.month, reference.day);

    final filtered = records.where((record) {
      final date = DateTime(
        record.serviceDate.year,
        record.serviceDate.month,
        record.serviceDate.day,
      );
      if (date.isAfter(periodEnd)) {
        return false;
      }
      if (periodStart != null && date.isBefore(periodStart)) {
        return false;
      }
      return true;
    }).toList();

    final summary = _buildSummary(filtered);
    final months = _buildMonths(
      filtered: filtered,
      period: period,
      periodStart: periodStart,
      reference: reference,
    );

    final totalExpensesByMonth = List<double>.filled(months.length, 0);
    final expensesByBucket = {
      for (final bucket in ReportsExpenseBucket.values)
        bucket: List<double>.filled(months.length, 0),
    };
    final mileageByMonth = List<double>.filled(months.length, 0);
    final latestMileageByMonth = List<(double mileage, DateTime date)?>.filled(
      months.length,
      null,
    );

    for (final record in filtered) {
      final monthIndex = _monthIndex(months, record.serviceDate);
      if (monthIndex == null) {
        continue;
      }

      final bucket = reportsBucketFor(record);
      if (bucket != null) {
        totalExpensesByMonth[monthIndex] += record.totalAmount;
        expensesByBucket[bucket]![monthIndex] += record.totalAmount;
      }

      final mileage = record.mileage;
      if (mileage != null) {
        final existing = latestMileageByMonth[monthIndex];
        if (existing == null ||
            record.serviceDate.isAfter(existing.$2) ||
            (record.serviceDate.isAtSameMomentAs(existing.$2) &&
                mileage > existing.$1)) {
          latestMileageByMonth[monthIndex] = (mileage, record.serviceDate);
        }
      }
    }

    for (var index = 0; index < mileageByMonth.length; index++) {
      mileageByMonth[index] = latestMileageByMonth[index]?.$1 ?? 0;
    }

    _forwardFillMileage(mileageByMonth);

    final expenseValuesInThousands = [
      ...totalExpensesByMonth,
      for (final bucket in ReportsExpenseBucket.values) ...expensesByBucket[bucket]!,
    ].map((value) => value / 1000).toList();

    return ReportsData(
      summary: summary,
      months: months,
      totalExpensesByMonth: totalExpensesByMonth,
      expensesByBucket: expensesByBucket,
      mileageByMonth: mileageByMonth,
      expenseYMax: _expenseChartMax(expenseValuesInThousands),
      mileageYMax: _mileageChartMax(mileageByMonth),
    );
  }

  static void _forwardFillMileage(List<double> mileageByMonth) {
    var lastKnown = 0.0;
    for (var index = 0; index < mileageByMonth.length; index++) {
      if (mileageByMonth[index] > 0) {
        lastKnown = mileageByMonth[index];
      } else if (lastKnown > 0) {
        mileageByMonth[index] = lastKnown;
      }
    }
  }

  static double _expenseChartMax(List<double> valuesInThousands) {
    if (valuesInThousands.isEmpty) {
      return 2;
    }

    final maxValue =
        valuesInThousands.reduce((left, right) => left > right ? left : right);
    if (maxValue <= 0) {
      return 2;
    }

    if (maxValue <= 10) {
      final padded = (maxValue * 1.25).ceilToDouble();
      return _chartMax(
        valuesInThousands,
        minMax: padded < 2 ? 2 : padded,
        step: padded <= 4 ? 1 : 2,
      );
    }

    return _chartMax(
      valuesInThousands,
      minMax: 10,
      step: 2,
    );
  }

  static ReportsSummary _buildSummary(List<ServiceRecordEntity> records) {
    var accessories = 0.0;
    var repairs = 0.0;
    var papers = 0.0;

    for (final record in records) {
      final bucket = reportsBucketFor(record);
      if (bucket == null) {
        continue;
      }

      switch (bucket) {
        case ReportsExpenseBucket.accessories:
          accessories += record.totalAmount;
        case ReportsExpenseBucket.repairs:
          repairs += record.totalAmount;
        case ReportsExpenseBucket.papers:
          papers += record.totalAmount;
      }
    }

    return ReportsSummary(
      accessoriesTotal: accessories,
      repairsTotal: repairs,
      papersTotal: papers,
    );
  }

  static List<DateTime> _buildMonths({
    required List<ServiceRecordEntity> filtered,
    required ReportsPeriod period,
    required DateTime? periodStart,
    required DateTime reference,
  }) {
    final currentMonth = DateTime(reference.year, reference.month);
    final firstMonth = switch (period) {
      ReportsPeriod.allTime => _earliestMonth(filtered) ?? _subtractMonths(currentMonth, 11),
      ReportsPeriod.thisYear => DateTime(reference.year, 1),
      ReportsPeriod.oneYear => _subtractMonths(currentMonth, 11),
      ReportsPeriod.twoYears => _subtractMonths(currentMonth, 23),
    };

    final normalizedStart = periodStart != null && periodStart.isAfter(firstMonth)
        ? DateTime(periodStart.year, periodStart.month)
        : firstMonth;

    final months = <DateTime>[];
    var cursor = normalizedStart;
    while (!cursor.isAfter(currentMonth)) {
      months.add(DateTime(cursor.year, cursor.month));
      cursor = _addMonths(cursor, 1);
    }

    if (months.isEmpty) {
      months.add(currentMonth);
    }

    return months;
  }

  static DateTime? _periodStart(ReportsPeriod period, DateTime reference) {
    return switch (period) {
      ReportsPeriod.allTime => null,
      ReportsPeriod.thisYear => DateTime(reference.year, 1, 1),
      ReportsPeriod.oneYear => _subtractMonths(
          DateTime(reference.year, reference.month, 1),
          11,
        ),
      ReportsPeriod.twoYears => _subtractMonths(
          DateTime(reference.year, reference.month, 1),
          23,
        ),
    };
  }

  static DateTime? _earliestMonth(List<ServiceRecordEntity> records) {
    if (records.isEmpty) {
      return null;
    }

    final earliest = records
        .map((record) => record.serviceDate)
        .reduce((a, b) => a.isBefore(b) ? a : b);

    return DateTime(earliest.year, earliest.month);
  }

  static int? _monthIndex(List<DateTime> months, DateTime date) {
    final key = DateTime(date.year, date.month);
    final index = months.indexWhere(
      (month) => month.year == key.year && month.month == key.month,
    );
    return index >= 0 ? index : null;
  }

  static DateTime _subtractMonths(DateTime date, int months) {
    var year = date.year;
    var month = date.month - months;

    while (month <= 0) {
      month += 12;
      year -= 1;
    }

    return DateTime(year, month, 1);
  }

  static DateTime _addMonths(DateTime date, int months) {
    var year = date.year;
    var month = date.month + months;

    while (month > 12) {
      month -= 12;
      year += 1;
    }

    return DateTime(year, month, 1);
  }

  static double _mileageChartMax(List<double> values) {
    if (values.isEmpty) {
      return 10;
    }

    final maxValue = values.reduce((a, b) => a > b ? a : b);
    if (maxValue <= 0) {
      return 10;
    }

    if (maxValue <= 10000) {
      return _chartMax(
        values,
        minMax: 10,
        step: 2000,
      );
    }

    return _chartMax(
      values,
      minMax: 10000,
      step: 10000,
    );
  }

  static double _chartMax(
    List<double> values, {
    required double minMax,
    required double step,
  }) {
    if (values.isEmpty) {
      return minMax;
    }

    final maxValue = values.reduce((a, b) => a > b ? a : b);
    if (maxValue <= 0) {
      return minMax;
    }

    final scaled = (maxValue / step).ceil() * step;
    return scaled < minMax ? minMax : scaled;
  }
}
