import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:flutter/material.dart';

class GarageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GarageAppBar({
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      title: Text(
        'Garagem',
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
        IconButton(
          tooltip: 'Adicionar veículo',
          onPressed: onAddPressed,
          icon: const Icon(Icons.add),
        ),
        SizedBox(width: AppSizes.spacingXs),
      ],
    );
  }
}
