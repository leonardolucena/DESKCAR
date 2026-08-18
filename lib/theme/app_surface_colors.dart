import 'package:flutter/material.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:deskcar/theme/app_contrast_extension.dart';

abstract final class AppSurfaceColors {
  static bool _isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color _resolve(
    BuildContext context, {
    required Color normalLight,
    required Color normalDark,
    required Color highContrastLight,
    required Color highContrastDark,
  }) {
    final isDark = _isDark(context);
    if (context.isHighContrast) {
      return isDark ? highContrastDark : highContrastLight;
    }

    return isDark ? normalDark : normalLight;
  }

  static Color screenBackground(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.listScreenBackgroundLight,
        normalDark: AppColors.backgroundDark,
        highContrastLight: AppColors.hcScreenBackgroundLight,
        highContrastDark: AppColors.hcScreenBackgroundDark,
      );

  static Color cardBackground(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.backgroundCardLight,
        normalDark: AppColors.backgroundDark,
        highContrastLight: AppColors.hcCardBackgroundLight,
        highContrastDark: AppColors.hcCardBackgroundDark,
      );

  static Color elevatedSurface(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.listScreenCardLight,
        normalDark: AppColors.backgroundDark,
        highContrastLight: AppColors.hcCardBackgroundLight,
        highContrastDark: AppColors.hcCardBackgroundDark,
      );

  static Color cardBorder(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.listScreenBorderLight,
        normalDark: AppColors.borderCardDark,
        highContrastLight: AppColors.hcBorderLight,
        highContrastDark: AppColors.hcBorderDark,
      );

  static Color subtleBorder(BuildContext context) {
    if (context.isHighContrast) {
      return cardBorder(context);
    }

    final isDark = _isDark(context);
    return isDark
        ? AppColors.borderCardDark
        : AppColors.primaryTextColorLight.withValues(alpha: 0.15);
  }

  static Color inputBorder(BuildContext context) {
    if (context.isHighContrast) {
      return cardBorder(context);
    }

    final isDark = _isDark(context);
    return isDark
        ? AppColors.borderCardDark
        : AppColors.primaryTextColorLight.withValues(alpha: 0.3);
  }

  static Color shimmerBase(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.segmentControlTrackLight,
        normalDark: AppColors.borderCardDark,
        highContrastLight: AppColors.hcBorderLight,
        highContrastDark: AppColors.hcBorderDark,
      );

  static Color segmentTrack(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.segmentControlTrackLight,
        normalDark: AppColors.segmentControlTrackDark,
        highContrastLight: AppColors.hcCardBackgroundLight,
        highContrastDark: AppColors.hcCardBackgroundDark,
      );

  static Color segmentBorder(BuildContext context) => cardBorder(context);

  static Color segmentThumb(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.segmentControlThumbLight,
        normalDark: AppColors.segmentControlThumbDark,
        highContrastLight: AppColors.hcAccentLight,
        highContrastDark: AppColors.hcAccentDark,
      );

  static Color segmentSelectedText(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.thirdTextColorLight,
        normalDark: AppColors.thirdTextColorDark,
        highContrastLight: AppColors.hcOnAccentLight,
        highContrastDark: AppColors.hcOnAccentDark,
      );

  static Color segmentUnselectedText(BuildContext context) {
    if (context.isHighContrast) {
      return _isDark(context)
          ? AppColors.hcPrimaryTextDark
          : AppColors.hcPrimaryTextLight;
    }

    final isDark = _isDark(context);
    return isDark
        ? AppColors.thirdTextColorDark.withValues(alpha: 0.65)
        : AppColors.primaryTextColorLight.withValues(alpha: 0.75);
  }

  static Color formScreenBackground(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.formScreenBackground,
        normalDark: AppColors.backgroundDark,
        highContrastLight: AppColors.hcScreenBackgroundLight,
        highContrastDark: AppColors.hcScreenBackgroundDark,
      );

  static Color formFieldFill(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.formFieldFill,
        normalDark: AppColors.formFieldFillDark,
        highContrastLight: AppColors.hcCardBackgroundLight,
        highContrastDark: AppColors.hcCardBackgroundDark,
      );

  static Color formFieldBorder(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.formFieldBorder,
        normalDark: AppColors.formFieldBorderDark,
        highContrastLight: AppColors.hcBorderLight,
        highContrastDark: AppColors.hcBorderDark,
      );

  static Color formCostFieldFill(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.formCostFieldFill,
        normalDark: AppColors.formCostFieldFillDark,
        highContrastLight: AppColors.hcCardBackgroundLight,
        highContrastDark: AppColors.hcCardBackgroundDark,
      );

  static Color formInfoFieldFill(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.formInfoFieldFill,
        normalDark: AppColors.formInfoFieldFillDark,
        highContrastLight: AppColors.hcCardBackgroundLight,
        highContrastDark: AppColors.hcCardBackgroundDark,
      );

  static Color formCostsHeader(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.formCostsHeader,
        normalDark: AppColors.formCostsHeaderDark,
        highContrastLight: AppColors.hcPrimaryTextLight,
        highContrastDark: AppColors.hcPrimaryTextDark,
      );

  static Color searchFieldFill(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.backgroundLight,
        normalDark: AppColors.formFieldFillDark,
        highContrastLight: AppColors.hcCardBackgroundLight,
        highContrastDark: AppColors.hcCardBackgroundDark,
      );

  static Color mutedText(BuildContext context) {
    if (context.isHighContrast) {
      return _isDark(context)
          ? AppColors.hcPrimaryTextDark.withValues(alpha: 0.75)
          : AppColors.hcPrimaryTextLight.withValues(alpha: 0.75);
    }

    return AppColors.repairsCostMuted;
  }

  static Color listDivider(BuildContext context) => cardBorder(context);

  static Color timelineUpcomingBackground(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.formInfoFieldFill,
        normalDark: AppColors.formFieldFillDark,
        highContrastLight: AppColors.hcCardBackgroundLight,
        highContrastDark: AppColors.hcCardBackgroundDark,
      );

  static Color chartBorder(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.reportsChartBorder,
        normalDark: AppColors.borderCardDark,
        highContrastLight: AppColors.hcBorderLight,
        highContrastDark: AppColors.hcBorderDark,
      );

  static Color fabBackground(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.repairsFabBackground,
        normalDark: AppColors.secondTextColorDark,
        highContrastLight: AppColors.hcAccentLight,
        highContrastDark: AppColors.hcAccentDark,
      );

  static Color fabForeground(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.backgroundCardLight,
        normalDark: AppColors.fourthTextColorDark,
        highContrastLight: AppColors.hcOnAccentLight,
        highContrastDark: AppColors.hcOnAccentDark,
      );

  static Color inputFocusBorder(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.bottomNavActiveLight,
        normalDark: AppColors.secondTextColorDark,
        highContrastLight: AppColors.hcBorderLight,
        highContrastDark: AppColors.hcBorderDark,
      );

  static Color switchActiveTrack(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.bottomNavActiveLight,
        normalDark: AppColors.secondTextColorDark,
        highContrastLight: AppColors.hcAccentLight,
        highContrastDark: AppColors.hcAccentDark,
      );

  static Color reportsLegendRepairsBg(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.reportsLegendRepairsBg,
        normalDark: AppColors.reportsLegendRepairsBgDark,
        highContrastLight: AppColors.hcCardBackgroundLight,
        highContrastDark: AppColors.hcCardBackgroundDark,
      );

  static Color reportsLegendPapersBg(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.reportsLegendPapersBg,
        normalDark: AppColors.reportsLegendPapersBgDark,
        highContrastLight: AppColors.hcCardBackgroundLight,
        highContrastDark: AppColors.hcCardBackgroundDark,
      );

  static Color reportsLegendAccessoriesBg(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.reportsLegendAccessoriesBg,
        normalDark: AppColors.reportsLegendAccessoriesBgDark,
        highContrastLight: AppColors.hcCardBackgroundLight,
        highContrastDark: AppColors.hcCardBackgroundDark,
      );

  static Color reportsLegendMileageBg(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.reportsLegendMileageBg,
        normalDark: AppColors.reportsLegendMileageBgDark,
        highContrastLight: AppColors.hcCardBackgroundLight,
        highContrastDark: AppColors.hcCardBackgroundDark,
      );

  static Color reportsTotalAccent(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.reportsTotalBlue,
        normalDark: AppColors.reportsTotalBlueDark,
        highContrastLight: AppColors.hcPrimaryTextLight,
        highContrastDark: AppColors.hcPrimaryTextDark,
      );

  static Color reportsMileageAccent(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.repairsMileageBlue,
        normalDark: AppColors.reportsTotalBlueDark,
        highContrastLight: AppColors.hcPrimaryTextLight,
        highContrastDark: AppColors.hcPrimaryTextDark,
      );

  static Color reportsAccessoriesAccent(BuildContext context) => _resolve(
        context,
        normalLight: AppColors.reportsAccessoriesPurple,
        normalDark: AppColors.reportsAccessoriesPurpleDark,
        highContrastLight: AppColors.hcPrimaryTextLight,
        highContrastDark: AppColors.hcPrimaryTextDark,
      );
}
