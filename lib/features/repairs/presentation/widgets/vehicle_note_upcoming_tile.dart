import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/features/repairs/presentation/widgets/vehicle_note_timeline_constants.dart';
import 'package:deskcar/features/repairs/presentation/widgets/vehicle_note_timeline_rail.dart';
import 'package:deskcar/features/repairs/presentation/widgets/vehicle_note_upcoming_entry.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:deskcar/theme/app_surface_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VehicleNoteUpcomingTile extends StatelessWidget {
  const VehicleNoteUpcomingTile({
    super.key,
    required this.entry,
    required this.connectTop,
    required this.connectBottom,
  });

  final VehicleNoteUpcomingEntry entry;
  final bool connectTop;
  final bool connectBottom;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VehicleNoteTimelineRail(
            connectTop: connectTop,
            connectBottom: connectBottom,
            child: Container(
              width: VehicleNoteTimelineConstants.iconSize,
              height: VehicleNoteTimelineConstants.iconSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: entry.iconColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                entry.icon,
                color: Colors.white,
                size: AppSizes.iconSm,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                AppSizes.spacingSm,
                AppSizes.spacingMd,
                AppSizes.cardPadding,
                AppSizes.spacingMd,
              ),
              color: AppSurfaceColors.timelineUpcomingBackground(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          entry.title,
                          style: theme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                        ),
                      ),
                      SizedBox(width: AppSizes.spacingSm),
                      Text(
                        AppDateFormatter.formatShortDayMonth(entry.targetDate),
                        style: theme.bodySmall?.copyWith(
                          color: AppSurfaceColors.mutedText(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.spacingXs),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (entry.mileage != null) ...[
                        Icon(
                          Icons.speed_outlined,
                          size: 3.6.w,
                          color: AppSurfaceColors.mutedText(context),
                        ),
                        SizedBox(width: AppSizes.spacingXs / 2),
                        Expanded(
                          child: Text(
                            AppCurrencyFormatter.formatMileage(
                              entry.mileage!,
                              entry.distanceUnit.label,
                            ),
                            style: theme.bodySmall?.copyWith(
                              color: AppSurfaceColors.mutedText(context),
                            ),
                          ),
                        ),
                      ] else
                        const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.schedule_outlined,
                            size: 3.6.w,
                            color: AppColors.secondTextColorLight,
                          ),
                          SizedBox(width: AppSizes.spacingXs / 2),
                          Text(
                            AppDateFormatter.formatDaysUntil(entry.targetDate),
                            style: theme.bodySmall?.copyWith(
                              color: AppColors.secondTextColorLight,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
