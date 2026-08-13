import 'package:deskcar/components/paginated_staggered_list_view.dart';
import 'package:deskcar/components/states/app_error_state.dart';
import 'package:deskcar/components/states/app_loading_state.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/router/app_routes.dart';
import 'package:deskcar/features/papers/presentation/cubit/papers_cubit.dart';
import 'package:deskcar/features/papers/presentation/cubit/papers_state.dart';
import 'package:deskcar/features/papers/presentation/widgets/paper_record_list_tile.dart';
import 'package:deskcar/features/papers/presentation/widgets/papers_app_bar.dart';
import 'package:deskcar/features/papers/presentation/widgets/select_document_bottom_sheet.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/theme/app_surface_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PapersPage extends StatefulWidget {
  const PapersPage({super.key});

  @override
  State<PapersPage> createState() => _PapersPageState();
}

class _PapersPageState extends State<PapersPage> {
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

  Future<void> _openNewDocumentFlow(BuildContext context) async {
    final selectedCategory = await showSelectDocumentBottomSheet(context);
    if (!context.mounted || selectedCategory == null) {
      return;
    }

    context.push(AppRoutes.addDocumentPath(selectedCategory.name));
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
    return BlocBuilder<PapersCubit, PapersState>(
      builder: (context, state) {
        final hasRecords =
            state.status == PapersStatus.loaded && state.records.isNotEmpty;

        return Scaffold(
          backgroundColor: AppSurfaceColors.cardBackground(context),
          appBar: hasRecords
              ? PapersAppBar(
                  isSearching: _isSearching,
                  searchController: _searchController,
                  searchFocusNode: _searchFocusNode,
                  onSearchPressed: _startSearch,
                  onSearchClose: _closeSearch,
                  onSearchChanged: (value) => setState(() => _searchQuery = value),
                )
              : null,
          body: switch (state.status) {
            PapersStatus.initial || PapersStatus.loading =>
              const AppLoadingState(itemCount: 4),
            PapersStatus.error => AppErrorState(
                message: state.errorMessage ?? 'Erro ao carregar os documentos.',
                onRetry: () => context.read<PapersCubit>().load(),
              ),
            PapersStatus.loaded => _PapersList(
                allRecords: state.records,
                filteredRecords: _filterRecords(state.records),
                isSearching: _isSearching,
                searchQuery: _searchQuery,
                listAnimationKey: Object.hash(
                  Object.hashAll(state.records.map((record) => record.id)),
                  _searchQuery,
                ),
              ),
          },
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppSurfaceColors.fabBackground(context),
            foregroundColor: AppSurfaceColors.fabForeground(context),
            onPressed: () => _openNewDocumentFlow(context),
            child: const Icon(Icons.note_add_outlined),
          ),
        );
      },
    );
  }
}

class _PapersList extends StatelessWidget {
  const _PapersList({
    required this.allRecords,
    required this.filteredRecords,
    required this.isSearching,
    required this.searchQuery,
    required this.listAnimationKey,
  });

  final List<ServiceRecordEntity> allRecords;
  final List<ServiceRecordEntity> filteredRecords;
  final bool isSearching;
  final String searchQuery;
  final int listAnimationKey;

  @override
  Widget build(BuildContext context) {
    if (allRecords.isEmpty) {
      return const PapersEmptyMessage();
    }

    if (filteredRecords.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.cardPadding),
          child: Text(
            'Nenhum documento encontrado para "$searchQuery".',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppSurfaceColors.mutedText(context),
                ),
          ),
        ),
      );
    }

    return AppPaginatedStaggeredListView(
      itemCount: filteredRecords.length,
      listAnimationKey: listAnimationKey,
      animateItems: !isSearching,
      itemKeyBuilder: (index) => filteredRecords[index].id,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        thickness: 1,
        color: AppSurfaceColors.listDivider(context),
        indent: AppSizes.cardPadding,
        endIndent: AppSizes.cardPadding,
      ),
      itemBuilder: (context, index) {
        final record = filteredRecords[index];

        return PaperRecordListTile(
          record: record,
          onTap: () => context.push(AppRoutes.editDocumentPath(record.id)),
        );
      },
    );
  }
}
