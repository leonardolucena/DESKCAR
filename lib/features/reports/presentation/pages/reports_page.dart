import 'package:deskcar/components/states/app_error_state.dart';
import 'package:deskcar/components/states/app_loading_state.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/features/reports/domain/entities/reports_data.dart';
import 'package:deskcar/features/reports/domain/entities/reports_expense_bucket.dart';
import 'package:deskcar/features/reports/domain/services/reports_aggregator.dart';
import 'package:deskcar/features/reports/presentation/cubit/reports_cubit.dart';
import 'package:deskcar/features/reports/presentation/cubit/reports_state.dart';
import 'package:deskcar/features/reports/presentation/widgets/reports_chart_card.dart';
import 'package:deskcar/features/reports/presentation/widgets/reports_filter_chips.dart';
import 'package:deskcar/features/reports/presentation/widgets/reports_summary_section.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCardLight,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Relatórios',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: BlocBuilder<ReportsCubit, ReportsState>(
        buildWhen: (previous, current) =>
            previous.status != current.status ||
            previous.hasLoadedOnce != current.hasLoadedOnce ||
            previous.errorMessage != current.errorMessage,
        builder: (context, state) {
          if (state.status == ReportsStatus.error) {
            return AppErrorState(
              message: state.errorMessage ?? 'Erro ao carregar os relatórios.',
              onRetry: () => context.read<ReportsCubit>().load(),
            );
          }

          if (!state.hasLoadedOnce) {
            return const AppLoadingState(itemCount: 2);
          }

          return const _ReportsBody();
        },
      ),
    );
  }
}

class _ReportsBody extends StatelessWidget {
  const _ReportsBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSizes.cardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<ReportsCubit, ReportsState>(
            buildWhen: (previous, current) =>
                previous.vehicleType != current.vehicleType ||
                previous.period != current.period ||
                previous.vehicles != current.vehicles ||
                previous.selectedVehicleId != current.selectedVehicleId ||
                previous.data.summary != current.data.summary,
            builder: (context, state) {
              final summary = state.data.summary;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ReportsFilterChips(
                    vehicleType: state.vehicleType,
                    period: state.period,
                    vehicles: state.vehicles,
                    selectedVehicleId: state.selectedVehicleId,
                    onVehicleTypeChanged:
                        context.read<ReportsCubit>().setVehicleType,
                    onVehicleSelected:
                        context.read<ReportsCubit>().setSelectedVehicle,
                    onPeriodChanged: context.read<ReportsCubit>().setPeriod,
                  ),
                  SizedBox(height: AppSizes.spacingMd),
                  ReportsSummarySection(
                    accessoriesTotal: summary.accessoriesTotal,
                    repairsTotal: summary.repairsTotal,
                    papersTotal: summary.papersTotal,
                  ),
                ],
              );
            },
          ),
          SizedBox(height: AppSizes.spacingMd),
          BlocBuilder<ReportsCubit, ReportsState>(
            buildWhen: (previous, current) => previous.data != current.data,
            builder: (context, state) {
              return _ReportsCharts(data: state.data);
            },
          ),
        ],
      ),
    );
  }
}

class _ReportsCharts extends StatelessWidget {
  const _ReportsCharts({required this.data});

  final ReportsData data;

  @override
  Widget build(BuildContext context) {
    final monthLabels =
        data.months.map(ReportsMonthFormatter.label).toList(growable: false);
    final summary = data.summary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ReportsChartCard(
          title: 'Todas as despesas',
          yAxisLabel: 'Custo, mil R\$',
          xLabels: monthLabels,
          yMax: data.expenseYMax,
          lines: [
            ReportsChartLine(
              color: AppColors.reportsTotalBlue,
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
        SizedBox(height: AppSizes.spacingLg),
        ReportsChartCard(
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
              color: AppColors.reportsAccessoriesPurple,
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
              backgroundColor: AppColors.reportsLegendRepairsBg,
              value: AppCurrencyFormatter.formatAmount(summary.repairsTotal),
            ),
            ReportsLegendItem(
              label: 'Papéis',
              color: AppColors.reportsPapersGreen,
              backgroundColor: AppColors.reportsLegendPapersBg,
              value: AppCurrencyFormatter.formatAmount(summary.papersTotal),
            ),
            ReportsLegendItem(
              label: 'Acessórios',
              color: AppColors.reportsAccessoriesPurple,
              backgroundColor: AppColors.reportsLegendAccessoriesBg,
              value: AppCurrencyFormatter.formatAmount(summary.accessoriesTotal),
            ),
          ],
        ),
        SizedBox(height: AppSizes.spacingLg),
        ReportsChartCard(
          title: 'Quilometragem',
          yAxisLabel: 'Quilometragem, km',
          xLabels: monthLabels,
          yMax: data.mileageYMax,
          useKilometerLabels: true,
          lines: [
            ReportsChartLine(
              color: AppColors.repairsMileageBlue,
              values: data.mileageByMonth,
            ),
          ],
          legendItems: [
            const ReportsLegendItem(label: 'Encontro'),
            ReportsLegendItem(
              label: 'Quilometragem',
              color: AppColors.repairsMileageBlue,
              backgroundColor: AppColors.reportsLegendMileageBg,
              value: _mileageLegendValue(data),
            ),
          ],
        ),
      ],
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
