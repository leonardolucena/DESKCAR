import 'package:deskcar/core/navigation/app_bottom_nav_destination.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.current,
    required this.onDestinationSelected,
    this.destinations = AppBottomNavDestination.values,
  });

  final AppBottomNavDestination current;
  final ValueChanged<AppBottomNavDestination> onDestinationSelected;
  final List<AppBottomNavDestination> destinations;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? AppColors.bottomNavBackgroundDark
        : AppColors.bottomNavBackgroundLight;
    final borderColor = isDark
        ? AppColors.bottomNavBorderDark
        : AppColors.bottomNavBorderLight;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: BorderSide(color: borderColor),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.spacingSm,
          ),
          child: Row(
            children: [
              for (final destination in destinations)
                Expanded(
                  child: _BottomNavItem(
                    destination: destination,
                    isSelected: destination == current,
                    onTap: () => onDestinationSelected(destination),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.destination,
    required this.isSelected,
    required this.onTap,
  });

  final AppBottomNavDestination destination;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final activeColor = isDark
        ? AppColors.bottomNavActiveDark
        : AppColors.bottomNavActiveLight;
    final inactiveColor = isDark
        ? AppColors.bottomNavInactiveDark
        : AppColors.bottomNavInactiveLight;
    final color = isSelected ? activeColor : inactiveColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              destination.icon,
              size: AppSizes.bottomNavIconSize,
              color: color,
            ),
            SizedBox(height: AppSizes.spacingXs / 2),
            Text(
              destination.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: color,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
