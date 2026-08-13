import 'package:deskcar/components/states/app_empty_state.dart';
import 'package:deskcar/components/states/app_error_state.dart';
import 'package:deskcar/components/states/app_loading_state.dart';
import 'package:deskcar/core/feedback/app_snackbar.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/router/app_routes.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/features/repairs/presentation/cubit/repairs_cubit.dart';
import 'package:deskcar/features/repairs/presentation/cubit/repairs_state.dart';
import 'package:deskcar/features/repairs/presentation/widgets/repairs_app_bar.dart';
import 'package:deskcar/features/repairs/presentation/widgets/select_service_bottom_sheet.dart';
import 'package:deskcar/features/repairs/presentation/widgets/service_record_list_tile.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RepairsPage extends StatelessWidget {
  const RepairsPage({super.key});

  Future<void> _openNewRepairFlow(BuildContext context) async {
    final selectedCategory = await showSelectServiceBottomSheet(context);
    if (!context.mounted || selectedCategory == null) {
      return;
    }

    context.push(AppRoutes.addServicePath(selectedCategory.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCardLight,
      appBar: RepairsAppBar(
        onSearchPressed: () {
          AppSnackbar.info(context, 'Busca em breve.');
        },
        onAddPressed: () => _openNewRepairFlow(context),
      ),
      body: BlocBuilder<RepairsCubit, RepairsState>(
        builder: (context, state) {
          return switch (state.status) {
            RepairsStatus.initial || RepairsStatus.loading =>
              const AppLoadingState(itemCount: 4),
            RepairsStatus.error => AppErrorState(
                message: state.errorMessage ?? 'Erro ao carregar os reparos.',
                onRetry: () => context.read<RepairsCubit>().load(),
              ),
            RepairsStatus.loaded => _RepairsList(
                records: state.records,
                onAddPressed: () => _openNewRepairFlow(context),
              ),
          };
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.repairsFabBackground,
        foregroundColor: AppColors.backgroundCardLight,
        onPressed: () => _openNewRepairFlow(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _RepairsList extends StatelessWidget {
  const _RepairsList({
    required this.records,
    required this.onAddPressed,
  });

  final List<ServiceRecordEntity> records;
  final VoidCallback onAddPressed;

  @override
  Widget build(BuildContext context) {
    if (records.isEmpty) {
      return AppEmptyState(
        title: 'Nenhum reparo registrado',
        message: 'Toque no + para adicionar a primeira nota de serviço.',
        icon: Icons.build_outlined,
        actionLabel: 'Novo reparo',
        onAction: onAddPressed,
      );
    }

    return ListView.separated(
      itemCount: records.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        thickness: 1,
        color: AppColors.repairsListDivider,
        indent: AppSizes.cardPadding,
        endIndent: AppSizes.cardPadding,
      ),
      itemBuilder: (context, index) {
        final record = records[index];
        return ServiceRecordListTile(
          record: record,
          onTap: () {
            AppSnackbar.info(context, 'Detalhe em breve.');
          },
        );
      },
    );
  }
}
