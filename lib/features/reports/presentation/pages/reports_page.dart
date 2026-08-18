import 'package:deskcar/components/states/app_error_state.dart';
import 'package:deskcar/components/states/app_loading_state.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/features/reports/presentation/cubit/reports_cubit.dart';
import 'package:deskcar/features/reports/presentation/cubit/reports_state.dart';
import 'package:deskcar/features/reports/presentation/widgets/reports_chart_tabs.dart';
import 'package:deskcar/features/reports/presentation/widgets/reports_filter_chips.dart';
import 'package:deskcar/features/reports/presentation/widgets/reports_summary_section.dart';
import 'package:deskcar/theme/app_surface_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppSurfaceColors.cardBackground(context),
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

class _ReportsBody extends StatefulWidget {
  const _ReportsBody();

  @override
  State<_ReportsBody> createState() => _ReportsBodyState();
}

class _ReportsBodyState extends State<_ReportsBody> {
  ReportsChartTab _selectedChart = ReportsChartTab.allExpenses;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  SizedBox(height: AppSizes.spacingSm),
                  ReportsSummarySection(
                    accessoriesTotal: summary.accessoriesTotal,
                    repairsTotal: summary.repairsTotal,
                    papersTotal: summary.papersTotal,
                  ),
                ],
              );
            },
          ),
          SizedBox(height: AppSizes.spacingSm),
          ReportsChartTabBar(
            selected: _selectedChart,
            onSelected: (tab) => setState(() => _selectedChart = tab),
          ),
          SizedBox(height: AppSizes.spacingSm),
          Expanded(
            child: BlocBuilder<ReportsCubit, ReportsState>(
              buildWhen: (previous, current) => previous.data != current.data,
              builder: (context, state) {
                return ReportsChartTabContent(
                  tab: _selectedChart,
                  data: state.data,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
