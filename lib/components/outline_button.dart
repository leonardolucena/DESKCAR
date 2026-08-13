import 'package:flutter/material.dart';
import 'package:deskcar/components/button_content.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color,
    this.enabled = true,
    this.expand = true,
    this.fitSingleLine = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? color;
  final bool enabled;
  final bool expand;
  final bool fitSingleLine;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Theme.of(context).colorScheme.primary;
    final isEnabled = enabled && onPressed != null;
    final contentColor =
        isEnabled ? effectiveColor : effectiveColor.withValues(alpha: 0.5);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
            border: Border.all(color: contentColor),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  fitSingleLine ? AppSizes.spacingSm : AppSizes.buttonPaddingH,
              vertical: AppSizes.buttonPaddingV,
            ),
            child: AppButtonContent(
              label: label,
              icon: icon,
              color: contentColor,
              expand: expand,
              fitSingleLine: fitSingleLine,
            ),
          ),
        ),
      ),
    );
  }
}
