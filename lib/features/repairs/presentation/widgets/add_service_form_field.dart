import 'package:deskcar/components/app_input_decoration.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/theme/app_surface_colors.dart';
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
    this.suffixText,
    this.suffixIcon,
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
  final String? suffixText;
  final IconData? suffixIcon;

  String? get _effectiveLabel {
    if (label != null && label!.trim().isNotEmpty) {
      return label;
    }

    if (hintText != null && hintText!.trim().isNotEmpty) {
      return hintText;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveLabel = _effectiveLabel;
    final fieldLabel = AppInputDecoration.buildLabel(context, effectiveLabel);
    final hasHeader = fieldLabel != null || counterText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasHeader) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              if (fieldLabel != null) Expanded(child: fieldLabel),
              if (counterText != null)
                Text(
                  counterText!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppSurfaceColors.mutedText(context),
                      ),
                ),
            ],
          ),
          SizedBox(height: AppSizes.formFieldLabelGap),
        ],
        TextField(
          controller: controller,
          onChanged: onChanged,
          onTap: onTap,
          readOnly: readOnly,
          showCursor: !readOnly,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: keyboardType ?? TextInputType.text,
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
          decoration: AppInputDecoration.outlined(
            context: context,
            fillColor: fillColor,
            suffixText: suffixText,
            suffixIcon: suffixIcon == null
                ? null
                : Icon(
                    suffixIcon,
                    color: AppSurfaceColors.mutedText(context),
                  ),
          ),
        ),
      ],
    );
  }
}
