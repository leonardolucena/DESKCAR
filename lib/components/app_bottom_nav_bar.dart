import 'package:deskcar/core/navigation/app_bottom_nav_destination.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:deskcar/theme/app_surface_colors.dart';
import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.current,
    required this.onDestinationSelected,
    this.onAddPressed,
    this.destinations = AppBottomNavDestination.values,
  });

  final AppBottomNavDestination current;
  final ValueChanged<AppBottomNavDestination> onDestinationSelected;
  final VoidCallback? onAddPressed;
  final List<AppBottomNavDestination> destinations;

  static const _selectionIndicatorHeight = 3.0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? AppColors.bottomNavBackgroundDark
        : AppColors.bottomNavBackgroundLight;
    final borderColor = isDark
        ? AppColors.bottomNavBorderDark
        : AppColors.bottomNavBorderLight;
    final indicatorColor = AppSurfaceColors.fabBackground(context);
    final navSlots = _buildNavSlots();

    return ColoredBox(
      color: backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: _selectionIndicatorHeight,
            child: Row(
              children: [
                for (final slot in navSlots)
                  Expanded(
                    child: slot.isAddButton
                        ? const SizedBox.shrink()
                        : AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            curve: Curves.easeOutCubic,
                            height: _selectionIndicatorHeight,
                            color: slot.destination == current
                                ? indicatorColor
                                : Colors.transparent,
                          ),
                  ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: borderColor,
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.spacingSm,
              ),
              child: Row(
                children: _buildItems(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<_BottomNavSlot> _buildNavSlots() {
    final slots = <_BottomNavSlot>[];

    for (final destination in destinations) {
      slots.add(_BottomNavSlot(destination: destination));

      if (destination == AppBottomNavDestination.papers &&
          onAddPressed != null) {
        slots.add(const _BottomNavSlot.addButton());
      }
    }

    return slots;
  }

  List<Widget> _buildItems(BuildContext context) {
    final items = <Widget>[];

    for (final destination in destinations) {
      items.add(
        Expanded(
          child: _BottomNavItem(
            destination: destination,
            isSelected: destination == current,
            onTap: () => onDestinationSelected(destination),
          ),
        ),
      );

      if (destination == AppBottomNavDestination.papers &&
          onAddPressed != null) {
        items.add(
          Expanded(
            child: _BottomNavAddButton(onPressed: onAddPressed!),
          ),
        );
      }
    }

    return items;
  }
}

class _BottomNavSlot {
  const _BottomNavSlot({required this.destination})
      : isAddButton = false;

  const _BottomNavSlot.addButton()
      : destination = null,
        isAddButton = true;

  final AppBottomNavDestination? destination;
  final bool isAddButton;
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

class _BottomNavAddButton extends StatelessWidget {
  const _BottomNavAddButton({required this.onPressed});

  final VoidCallback onPressed;

  static const _sizeReduction = 8.0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = AppSurfaceColors.fabBackground(context);
    final foregroundColor = AppSurfaceColors.fabForeground(context);
    final buttonSize =
        (AppSizes.bottomNavHeight * 0.72 - _sizeReduction).clamp(36.0, 52.0);
    final shadowBaseColor =
        isDark ? AppColors.secondTextColorLight : backgroundColor;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: _softFadeShadow(shadowBaseColor),
          ),
          child: Material(
            color: backgroundColor,
            shape: const CircleBorder(),
            elevation: 0,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onPressed,
              child: SizedBox(
                width: buttonSize,
                height: buttonSize,
                child: Icon(
                  Icons.add,
                  color: foregroundColor,
                  size: AppSizes.bottomNavIconSize * 0.92,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Halo compacto — blur baixo evita corte nas bordas da bottom bar.
  static List<BoxShadow> _softFadeShadow(Color baseColor) {
    return [
      BoxShadow(
        color: baseColor.withValues(alpha: 0.12),
        blurRadius: 2,
        offset: const Offset(0, 0.5),
      ),
      BoxShadow(
        color: baseColor.withValues(alpha: 0.06),
        blurRadius: 5,
        offset: const Offset(0, 1),
      ),
    ];
  }
}
