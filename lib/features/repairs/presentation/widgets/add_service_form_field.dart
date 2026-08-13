import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddServiceFormField extends StatelessWidget {
  const AddServiceFormField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.maxLength,
    this.counterText,
    this.fillColor,
    this.minLines,
    this.maxLines,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final int? maxLength;
  final String? counterText;
  final Color? fillColor;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final effectiveFillColor = fillColor ?? AppColors.formFieldFill;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: effectiveFillColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSizes.borderRadius),
            ),
            border: Border(
              bottom: BorderSide(color: AppColors.formFieldBorder),
            ),
          ),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            onTap: onTap,
            readOnly: readOnly,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            minLines: minLines,
            maxLines: maxLines ?? (minLines != null ? null : 1),
            buildCounter: (
              context, {
              required currentLength,
              required isFocused,
              required maxLength,
            }) =>
                null,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              alignLabelWithHint: minLines != null && minLines! > 1,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppSizes.inputPaddingH,
                vertical: AppSizes.inputPaddingV,
              ),
            ),
          ),
        ),
        if (counterText != null) ...[
          SizedBox(height: AppSizes.spacingXs / 2),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              counterText!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.repairsCostMuted,
                  ),
            ),
          ),
        ],
      ],
    );
  }
}
