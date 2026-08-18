import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:deskcar/theme/app_surface_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppInputDecoration {
  static const double focusedBorderWidth = 2;

  static Widget? buildLabel(
    BuildContext context,
    String? label, {
    bool hasError = false,
  }) {
    if (label == null || label.trim().isEmpty) {
      return null;
    }

    final labelColor = Theme.of(context).colorScheme.onSurface.withValues(
          alpha: 0.72,
        );

    return Text(
      label,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: hasError ? AppColors.borderError : labelColor,
            fontWeight: FontWeight.w500,
          ),
    );
  }

  static InputDecoration outlined({
    required BuildContext context,
    String? hintText,
    Color? fillColor,
    bool hasError = false,
    String? suffixText,
    Widget? suffixIcon,
    EdgeInsetsGeometry? contentPadding,
  }) {
    final effectiveFillColor =
        fillColor ?? AppSurfaceColors.formFieldFill(context);
    final enabledBorderColor = hasError
        ? AppColors.borderError
        : AppSurfaceColors.formFieldBorder(context);
    final focusedBorderColor = hasError
        ? AppColors.borderError
        : AppSurfaceColors.inputFocusBorder(context);
    final radius = BorderRadius.circular(AppSizes.inputBorderRadius);

    OutlineInputBorder outlineBorder(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return InputDecoration(
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.45),
          ),
      filled: true,
      fillColor: effectiveFillColor,
      contentPadding: contentPadding ??
          EdgeInsets.symmetric(
            horizontal: AppSizes.inputPaddingH,
            vertical: AppSizes.formInputPaddingV,
          ),
      enabledBorder: outlineBorder(enabledBorderColor),
      focusedBorder: outlineBorder(
        focusedBorderColor,
        width: focusedBorderWidth,
      ),
      disabledBorder: outlineBorder(enabledBorderColor),
      border: outlineBorder(enabledBorderColor),
      errorBorder: outlineBorder(AppColors.borderError),
      focusedErrorBorder: outlineBorder(
        AppColors.borderError,
        width: focusedBorderWidth,
      ),
      suffixText: suffixText,
      suffixStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppSurfaceColors.mutedText(context),
          ),
      suffixIcon: suffixIcon,
    );
  }
}
