import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RepairsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RepairsAppBar({
    super.key,
    this.onSearchPressed,
    this.onAddPressed,
  });

  final VoidCallback? onSearchPressed;
  final VoidCallback? onAddPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Notas de carro',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
      leading: IconButton(
        tooltip: 'Configurações',
        onPressed: () {},
        icon: const Icon(Icons.settings_outlined),
      ),
      actions: [
        IconButton(
          tooltip: 'Buscar',
          onPressed: onSearchPressed,
          icon: const Icon(Icons.search),
        ),
        IconButton(
          tooltip: 'Garagem',
          onPressed: () => context.push(AppRoutes.garage),
          icon: const Icon(Icons.garage_outlined),
        ),
        IconButton(
          tooltip: 'Adicionar',
          onPressed: onAddPressed,
          icon: const Icon(Icons.add),
        ),
        SizedBox(width: AppSizes.spacingXs),
      ],
    );
  }
}
