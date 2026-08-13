import 'package:flutter/material.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';

class AppButtonContent extends StatelessWidget {
  const AppButtonContent({
    super.key,
    required this.label,
    required this.color,
    this.icon,
    this.labelStyle,
    this.expand = true,
    this.fitSingleLine = false,
  });

  final String label;
  final Color color;
  final IconData? icon;
  final TextStyle? labelStyle;
  final bool expand;
  final bool fitSingleLine;

  @override
  Widget build(BuildContext context) {
    final textStyle = (labelStyle ?? Theme.of(context).textTheme.labelLarge)
        ?.copyWith(color: color);

    Widget buildLabel() {
      if (fitSingleLine) {
        return Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.visible,
              style: textStyle,
            ),
          ),
        );
      }

      if (expand) {
        return Flexible(
          child: Text(
            label,
            textAlign: TextAlign.center,
            softWrap: true,
            style: textStyle,
          ),
        );
      }

      return Text(
        label,
        textAlign: TextAlign.center,
        softWrap: true,
        style: textStyle,
      );
    }

    final content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            size: AppSizes.iconMd,
            color: color,
          ),
          SizedBox(width: AppSizes.spacingXs),
        ],
        buildLabel(),
      ],
    );

    if (!expand) {
      return content;
    }

    return SizedBox(width: double.infinity, child: content);
  }
}
