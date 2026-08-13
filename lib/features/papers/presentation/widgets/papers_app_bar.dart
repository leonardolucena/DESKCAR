import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PapersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PapersAppBar({
    super.key,
    this.isSearching = false,
    this.searchController,
    this.searchFocusNode,
    this.onSearchPressed,
    this.onSearchClose,
    this.onSearchChanged,
  });

  final bool isSearching;
  final TextEditingController? searchController;
  final FocusNode? searchFocusNode;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onSearchClose;
  final ValueChanged<String>? onSearchChanged;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    if (isSearching) {
      return AppBar(
        leading: IconButton(
          tooltip: 'Fechar busca',
          onPressed: onSearchClose,
          icon: const Icon(Icons.arrow_back),
        ),
        titleSpacing: 0,
        title: TextField(
          controller: searchController,
          focusNode: searchFocusNode,
          autofocus: true,
          onChanged: onSearchChanged,
          decoration: InputDecoration(
            hintText: 'Pesquisar documento...',
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSizes.spacingSm,
              vertical: AppSizes.spacingSm,
            ),
          ),
          style: Theme.of(context).textTheme.bodyLarge,
          textInputAction: TextInputAction.search,
        ),
        actions: [
          IconButton(
            tooltip: 'Buscar',
            onPressed: () => searchFocusNode?.requestFocus(),
            icon: const Icon(Icons.search),
          ),
          SizedBox(width: AppSizes.spacingXs),
        ],
      );
    }

    return AppBar(
      centerTitle: true,
      title: Text(
        'Papéis',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
      actions: [
        IconButton(
          tooltip: 'Buscar',
          onPressed: onSearchPressed,
          icon: const Icon(Icons.search),
        ),
        SizedBox(width: AppSizes.spacingXs),
      ],
    );
  }
}

class PapersEmptyMessage extends StatelessWidget {
  const PapersEmptyMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.cardPadding * 1.5),
        child: Text(
          'Adicione aqui informações sobre multas, impostos, seguros e outros documentos.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.repairsCostMuted,
              ),
        ),
      ),
    );
  }
}
