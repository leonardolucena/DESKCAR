import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RepairsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RepairsAppBar({
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
            hintText: 'Pesquisar nota...',
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
      leading: IconButton(
        tooltip: 'Garagem',
        onPressed: () => context.push(AppRoutes.garage),
        icon: const Icon(Icons.garage_outlined),
      ),
      title: Text(
        'Notas do veículo',
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
