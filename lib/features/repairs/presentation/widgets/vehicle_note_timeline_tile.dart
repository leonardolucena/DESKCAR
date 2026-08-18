import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/features/repairs/presentation/widgets/vehicle_note_timeline_constants.dart';
import 'package:deskcar/features/repairs/presentation/widgets/vehicle_note_timeline_rail.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:deskcar/theme/app_surface_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VehicleNoteTimelineTile extends StatelessWidget {
  const VehicleNoteTimelineTile({
    super.key,
    required this.record,
    required this.showTopRail,
    required this.showBottomRail,
    this.onTap,
  });

  final ServiceRecordEntity record;
  final bool showTopRail;
  final bool showBottomRail;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final category = record.category;
    final theme = Theme.of(context).textTheme;
    final subtitle = _resolveSubtitle(record);
    final hasAmount = record.totalAmount > 0;
    final showLocationPin = _showsLocationPin(record);
    final amountColor = _resolveAmountColor(context, record);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              VehicleNoteTimelineRail(
                connectTop: showTopRail,
                connectBottom: showBottomRail,
                child: Container(
                  width: VehicleNoteTimelineConstants.iconSize,
                  height: VehicleNoteTimelineConstants.iconSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: category.iconColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    category.icon,
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
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppSurfaceColors.listDivider(context),
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    record.title,
                                    style: theme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                                if (showLocationPin) ...[
                                  SizedBox(width: AppSizes.spacingXs / 2),
                                  Icon(
                                    Icons.push_pin,
                                    size: 3.4.w,
                                    color: AppColors.repairsMileageBlue,
                                  ),
                                ],
                              ],
                            ),
                          ),
                          SizedBox(width: AppSizes.spacingSm),
                          Text(
                            AppDateFormatter.formatShortDayMonth(
                              record.serviceDate,
                            ),
                            style: theme.bodySmall?.copyWith(
                              color: AppSurfaceColors.mutedText(context),
                            ),
                          ),
                        ],
                      ),
                      if (subtitle != null) ...[
                        SizedBox(height: AppSizes.spacingXs / 2),
                        _DetailLine(
                          icon: _subtitleIcon(subtitle),
                          text: subtitle,
                        ),
                      ],
                      if (record.mileage != null || hasAmount) ...[
                        SizedBox(height: AppSizes.spacingXs),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (record.mileage != null) ...[
                              Icon(
                                Icons.speed_outlined,
                                size: 3.6.w,
                                color: AppSurfaceColors.mutedText(context),
                              ),
                              SizedBox(width: AppSizes.spacingXs / 2),
                              Expanded(
                                child: Text(
                                  AppCurrencyFormatter.formatMileage(
                                    record.mileage!,
                                    record.distanceUnit.label,
                                  ),
                                  style: theme.bodySmall?.copyWith(
                                    color: AppSurfaceColors.mutedText(context),
                                  ),
                                ),
                              ),
                            ] else
                              const Spacer(),
                            if (hasAmount)
                              Text(
                                AppCurrencyFormatter.formatAmountWithCents(
                                  record.totalAmount,
                                ),
                                style: theme.titleSmall?.copyWith(
                                  color: amountColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _resolveSubtitle(ServiceRecordEntity record) {
    final notes = record.notes?.trim();
    if (notes != null && notes.isNotEmpty) {
      return notes;
    }

    final supplierCodes = record.supplierCodes?.trim();
    if (supplierCodes != null && supplierCodes.isNotEmpty) {
      return supplierCodes;
    }

    return null;
  }

  bool _showsLocationPin(ServiceRecordEntity record) {
    final title = record.title.toLowerCase();
    if (title.contains('abastec') || title.contains('combust')) {
      return true;
    }

    final subtitle = _resolveSubtitle(record)?.toLowerCase();
    if (subtitle == null) {
      return false;
    }

    return subtitle.contains('posto') ||
        subtitle.contains('casa') ||
        subtitle.startsWith('de ');
  }

  Color _resolveAmountColor(BuildContext context, ServiceRecordEntity record) {
    final title = record.title.toLowerCase();
    if (title.contains('transporte') || title.contains('aplicativo')) {
      return AppColors.repairsTotalGreen;
    }

    return Theme.of(context).colorScheme.onSurface;
  }

  IconData _subtitleIcon(String subtitle) {
    final normalized = subtitle.toLowerCase();
    if (normalized.contains('posto') ||
        normalized.contains('casa') ||
        normalized.startsWith('de ')) {
      return Icons.place_outlined;
    }

    return Icons.notes_outlined;
  }
}

class _DetailLine extends StatelessWidget {
  const _DetailLine({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(
          icon,
          size: 3.6.w,
          color: AppSurfaceColors.mutedText(context),
        ),
        SizedBox(width: AppSizes.spacingXs / 2),
        Expanded(
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.bodySmall?.copyWith(
              color: AppSurfaceColors.mutedText(context),
            ),
          ),
        ),
      ],
    );
  }
}
