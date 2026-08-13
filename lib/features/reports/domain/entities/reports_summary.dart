import 'package:equatable/equatable.dart';

class ReportsSummary extends Equatable {
  const ReportsSummary({
    this.accessoriesTotal = 0,
    this.repairsTotal = 0,
    this.papersTotal = 0,
  });

  final double accessoriesTotal;
  final double repairsTotal;
  final double papersTotal;

  double get total => accessoriesTotal + repairsTotal + papersTotal;

  @override
  List<Object?> get props => [accessoriesTotal, repairsTotal, papersTotal];
}
