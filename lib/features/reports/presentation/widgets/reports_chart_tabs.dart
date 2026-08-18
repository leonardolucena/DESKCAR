import 'package:deskcar/components/segmented_control.dart';
import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/features/reports/domain/entities/reports_data.dart';
import 'package:deskcar/features/reports/domain/entities/reports_expense_bucket.dart';
import 'package:deskcar/features/reports/domain/services/reports_aggregator.dart';
import 'package:deskcar/features/reports/presentation/widgets/reports_chart_card.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:deskcar/theme/app_surface_colors.dart';
import 'package:flutter/material.dart';

enum ReportsChartTab {
  allExpenses('Despesas'),
  byCategory('Categorias'),
  mileage('Quilometragem');

  const ReportsChartTab(this.label);

  final String label;
}

class ReportsChartTabBar extends StatelessWidget {
  const ReportsChartTabBar({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final ReportsChartTab selected;
  final ValueChanged<ReportsChartTab> onSelected;

  @override
  Widget build(BuildContext context) {
    return AppSegmentedControl<ReportsChartTab>(
      selected: selected,
      onSelected: onSelected,
      segments: [
        for (final tab in ReportsChartTab.values)
          AppSegmentedControlSegment(
            value: tab,
            label: tab.label,
          ),
      ],
    );
  }
}

class ReportsChartTabContent extends StatelessWidget {
  const ReportsChartTabContent({
    super.key,
    required this.tab,
    required this.data,
  });

  final ReportsChartTab tab;
  final ReportsData data;

  @override
  Widget build(BuildContext context) {
    final monthLabels =
        data.months.map(ReportsMonthFormatter.label).toList(growable: false);
    final summary = data.summary;

    final totalAccent = AppSurfaceColors.reportsTotalAccent(context);
    final mileageAccent = AppSurfaceColors.reportsMileageAccent(context);
    final accessoriesAccent = AppSurfaceColors.reportsAccessoriesAccent(context);

    final chart = switch (tab) {
      ReportsChartTab.allExpenses => _chart(
          title: 'Todas as despesas',
          yAxisLabel: 'Custo, mil R\$',
          xLabels: monthLabels,
          yMax: data.expenseYMax,
          lines: [
            ReportsChartLine(
              color: totalAccent,
              values: _expenseValues(data.totalExpensesByMonth),
            ),
          ],
          legendItems: [
            const ReportsLegendItem(label: 'Encontro'),
            ReportsLegendItem(
              label: 'Custos',
              value: AppCurrencyFormatter.formatAmount(summary.total),
            ),
          ],
        ),
      ReportsChartTab.byCategory => _chart(
          title: 'Despesas por categoria',
          yAxisLabel: 'Custo, mil R\$',
          xLabels: monthLabels,
          yMax: data.expenseYMax,
          compactXLabels: monthLabels.length > 8,
          lines: [
            ReportsChartLine(
              color: AppColors.reportsRepairsRed,
              values: _expenseValues(
                data.bucketValues(ReportsExpenseBucket.repairs),
              ),
              showArea: false,
            ),
            ReportsChartLine(
              color: AppColors.reportsPapersGreen,
              values: _expenseValues(
                data.bucketValues(ReportsExpenseBucket.papers),
              ),
              showArea: false,
            ),
            ReportsChartLine(
              color: accessoriesAccent,
              values: _expenseValues(
                data.bucketValues(ReportsExpenseBucket.accessories),
              ),
              showArea: false,
            ),
          ],
          legendItems: [
            const ReportsLegendItem(label: 'Encontro'),
            ReportsLegendItem(
              label: 'Reparos',
              color: AppColors.reportsRepairsRed,
              backgroundColor: AppSurfaceColors.reportsLegendRepairsBg(context),
              value: AppCurrencyFormatter.formatAmount(summary.repairsTotal),
            ),
            ReportsLegendItem(
              label: 'Papéis',
              color: AppColors.reportsPapersGreen,
              backgroundColor: AppSurfaceColors.reportsLegendPapersBg(context),
              value: AppCurrencyFormatter.formatAmount(summary.papersTotal),
            ),
            ReportsLegendItem(
              label: 'Acessórios',
              color: accessoriesAccent,
              backgroundColor:
                  AppSurfaceColors.reportsLegendAccessoriesBg(context),
              value: AppCurrencyFormatter.formatAmount(summary.accessoriesTotal),
            ),
          ],
        ),
      ReportsChartTab.mileage => _chart(
          title: 'Quilometragem',
          yAxisLabel: 'Quilometragem, km',
          xLabels: monthLabels,
          yMax: data.mileageYMax,
          useKilometerLabels: true,
          lines: [
            ReportsChartLine(
              color: mileageAccent,
              values: data.mileageByMonth,
            ),
          ],
          legendItems: [
            const ReportsLegendItem(label: 'Encontro'),
            ReportsLegendItem(
              label: 'Quilometragem',
              color: mileageAccent,
              backgroundColor: AppSurfaceColors.reportsLegendMileageBg(context),
              value: _mileageLegendValue(data),
            ),
          ],
        ),
    };

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: chart,
          ),
        );
      },
    );
  }

  ReportsChartCard _chart({
    required String title,
    required String yAxisLabel,
    required List<String> xLabels,
    required double yMax,
    required List<ReportsChartLine> lines,
    required List<ReportsLegendItem> legendItems,
    bool compactXLabels = false,
    bool useKilometerLabels = false,
  }) {
    return ReportsChartCard(
      title: title,
      yAxisLabel: yAxisLabel,
      xLabels: xLabels,
      yMax: yMax,
      compactXLabels: compactXLabels,
      useKilometerLabels: useKilometerLabels,
      lines: lines,
      legendItems: legendItems,
    );
  }

  List<double> _expenseValues(List<double> values) {
    return [
      for (final value in values) value / 1000,
    ];
  }

  String _mileageLegendValue(ReportsData data) {
    if (data.mileageByMonth.isEmpty) {
      return '---';
    }

    final lastMileage = data.mileageByMonth.lastWhere(
      (value) => value > 0,
      orElse: () => 0,
    );
    if (lastMileage <= 0) {
      return '---';
    }

    return AppCurrencyFormatter.formatMileage(lastMileage, 'km');
  }
}
