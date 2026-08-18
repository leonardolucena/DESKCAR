import 'package:deskcar/components/app_input_decoration.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    required this.label,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.focusNode,
    this.autofillHints,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.compact = false,
    this.helperText,
    this.hintText,
    this.minLines,
    this.reserveErrorSpace = true,
    this.maintainBorderOnFocus = false,
    this.fillColor,
  });

  final TextEditingController? controller;
  final String label;
  final String? errorText;
  final String? helperText;
  final String? hintText;
  final int? minLines;
  final bool reserveErrorSpace;
  final bool maintainBorderOnFocus;
  final Color? fillColor;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool enabled;
  final int maxLines;
  final FocusNode? focusNode;
  final Iterable<String>? autofillHints;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final bool compact;

  bool get _hasError => errorText != null && errorText!.isNotEmpty;
  bool get _showLabel => _effectiveLabel.isNotEmpty;
  bool get _isMultiline => maxLines > 1;

  String get _effectiveLabel {
    if (label.trim().isNotEmpty) {
      return label;
    }

    if (hintText != null && hintText!.trim().isNotEmpty) {
      return hintText!.trim();
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    final suffix = suffixIcon == null
        ? null
        : GestureDetector(
            onTap: enabled ? onSuffixIconPressed : null,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.spacingSm),
              child: Icon(
                suffixIcon,
                size: AppSizes.inputSuffixIconSize,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: enabled ? 0.6 : 0.3),
              ),
            ),
          );

    final decoration = AppInputDecoration.outlined(
      context: context,
      fillColor: fillColor,
      hasError: _hasError,
      suffixIcon: suffix,
    );

    final fieldLabel = AppInputDecoration.buildLabel(
      context,
      _showLabel ? _effectiveLabel : null,
      hasError: _hasError,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (fieldLabel != null) ...[
          fieldLabel,
          SizedBox(height: AppSizes.formFieldLabelGap),
        ],
        TextField(
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          minLines: _isMultiline ? minLines : null,
          maxLines: maxLines,
          autofillHints: autofillHints,
          style: Theme.of(context).textTheme.bodyLarge,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          decoration: maintainBorderOnFocus
              ? decoration.copyWith(
                  focusedBorder: decoration.enabledBorder,
                )
              : decoration,
        ),
        if (helperText != null && !_hasError) ...[
          SizedBox(height: AppSizes.spacingXs / 2),
          Text(
            helperText!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.6),
                ),
          ),
        ],
        if (_hasError || reserveErrorSpace) ...[
          SizedBox(height: compact ? 0 : AppSizes.spacingXs),
          SizedBox(
            height: _hasError || reserveErrorSpace
                ? (compact
                    ? AppSizes.errorAreaHeightCompact
                    : AppSizes.errorAreaHeight)
                : 0,
            width: double.infinity,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                errorText ?? '',
                style: AppTextTheme.error,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
