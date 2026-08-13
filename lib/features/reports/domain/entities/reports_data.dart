import 'package:deskcar/features/reports/domain/entities/reports_expense_bucket.dart';
import 'package:deskcar/features/reports/domain/entities/reports_summary.dart';
import 'package:equatable/equatable.dart';

class ReportsData extends Equatable {
  const ReportsData({
    required this.summary,
    required this.months,
    required this.totalExpensesByMonth,
    required this.expensesByBucket,
    required this.mileageByMonth,
    required this.expenseYMax,
    required this.mileageYMax,
  });

  static const empty = ReportsData(
    summary: ReportsSummary(),
    months: [],
    totalExpensesByMonth: [],
    expensesByBucket: {},
    mileageByMonth: [],
    expenseYMax: 10,
    mileageYMax: 10,
  );

  final ReportsSummary summary;
  final List<DateTime> months;
  final List<double> totalExpensesByMonth;
  final Map<ReportsExpenseBucket, List<double>> expensesByBucket;
  final List<double> mileageByMonth;
  final double expenseYMax;
  final double mileageYMax;

  List<double> bucketValues(ReportsExpenseBucket bucket) {
    return expensesByBucket[bucket] ?? List.filled(months.length, 0);
  }

  @override
  List<Object?> get props => [
        summary,
        months,
        totalExpensesByMonth,
        expensesByBucket,
        mileageByMonth,
        expenseYMax,
        mileageYMax,
      ];
}
