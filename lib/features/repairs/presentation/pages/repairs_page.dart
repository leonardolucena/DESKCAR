import 'package:deskcar/components/states/app_empty_state.dart';
import 'package:deskcar/components/states/app_error_state.dart';
import 'package:deskcar/components/states/app_loading_state.dart';
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

class RepairsPage extends StatefulWidget {
  const RepairsPage({super.key});

  @override
  State<RepairsPage> createState() => _RepairsPageState();
}

class _RepairsPageState extends State<RepairsPage> {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();
  bool _isSearching = false;
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  Future<void> _openNewRepairFlow(BuildContext context) async {
    final selectedCategory = await showSelectServiceBottomSheet(context);
    if (!context.mounted || selectedCategory == null) {
      return;
    }

    context.push(AppRoutes.addServicePath(selectedCategory.name));
  }

  void _startSearch() {
    setState(() => _isSearching = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  void _closeSearch() {
    setState(() {
      _isSearching = false;
      _searchQuery = '';
      _searchController.clear();
    });
  }

  List<ServiceRecordEntity> _filterRecords(List<ServiceRecordEntity> records) {
    final query = _searchQuery.trim().toLowerCase();
    if (query.isEmpty) {
      return records;
    }

    return records
        .where((record) => record.title.toLowerCase().contains(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepairsCubit, RepairsState>(
      builder: (context, state) {
        final hasRecords =
            state.status == RepairsStatus.loaded && state.records.isNotEmpty;

        return Scaffold(
          backgroundColor: AppColors.backgroundCardLight,
          appBar: RepairsAppBar(
            isSearching: _isSearching,
            searchController: _searchController,
            searchFocusNode: _searchFocusNode,
            onSearchPressed: _startSearch,
            onSearchClose: _closeSearch,
            onSearchChanged: (value) => setState(() => _searchQuery = value),
          ),
          body: switch (state.status) {
            RepairsStatus.initial || RepairsStatus.loading =>
              const AppLoadingState(itemCount: 4),
            RepairsStatus.error => AppErrorState(
                message: state.errorMessage ?? 'Erro ao carregar os reparos.',
                onRetry: () => context.read<RepairsCubit>().load(),
              ),
            RepairsStatus.loaded => _RepairsList(
                allRecords: state.records,
                filteredRecords: _filterRecords(state.records),
                isSearching: _isSearching,
                searchQuery: _searchQuery,
                onAddPressed: () => _openNewRepairFlow(context),
              ),
          },
          floatingActionButton: hasRecords
              ? FloatingActionButton(
                  backgroundColor: AppColors.repairsFabBackground,
                  foregroundColor: AppColors.backgroundCardLight,
                  onPressed: () => _openNewRepairFlow(context),
                  child: const Icon(Icons.add),
                )
              : null,
        );
      },
    );
  }
}

class _RepairsList extends StatelessWidget {
  const _RepairsList({
    required this.allRecords,
    required this.filteredRecords,
    required this.isSearching,
    required this.searchQuery,
    required this.onAddPressed,
  });

  final List<ServiceRecordEntity> allRecords;
  final List<ServiceRecordEntity> filteredRecords;
  final bool isSearching;
  final String searchQuery;
  final VoidCallback onAddPressed;

  @override
  Widget build(BuildContext context) {
    if (allRecords.isEmpty) {
      return AppEmptyState(
        title: 'Nenhum reparo registrado',
        message:
            'Adicione a primeira nota de serviço para começar a registrar despesas.',
        icon: Icons.build_outlined,
        actionLabel: 'Novo reparo',
        onAction: onAddPressed,
      );
    }

    if (filteredRecords.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.cardPadding),
          child: Text(
            'Nenhuma nota encontrada para "$searchQuery".',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.repairsCostMuted,
                ),
          ),
        ),
      );
    }

    return ListView.separated(
      itemCount: filteredRecords.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        thickness: 1,
        color: AppColors.repairsListDivider,
        indent: AppSizes.cardPadding,
        endIndent: AppSizes.cardPadding,
      ),
      itemBuilder: (context, index) {
        final record = filteredRecords[index];
        return ServiceRecordListTile(
          record: record,
          onTap: () => context.push(AppRoutes.editServicePath(record.id)),
        );
      },
    );
  }
}
