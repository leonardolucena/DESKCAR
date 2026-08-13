import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/features/papers/domain/entities/paper_document_category.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaperRecordListTile extends StatelessWidget {
  const PaperRecordListTile({
    super.key,
    required this.record,
    this.onTap,
  });

  final ServiceRecordEntity record;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final category = PaperDocumentCategory.fromRecord(record);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.cardPadding,
            vertical: AppSizes.spacingMd,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 12.w,
                height: 12.w,
                decoration: BoxDecoration(
                  color: category.iconBackgroundColor,
                  borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                ),
                child: Icon(
                  category.icon,
                  color: category.iconColor,
                  size: AppSizes.iconMd,
                ),
              ),
              SizedBox(width: AppSizes.spacingMd),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppDateFormatter.formatDayMonthYear(record.serviceDate),
                    maxLines: 1,
                    softWrap: false,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  if (record.mileage != null) ...[
                    SizedBox(height: AppSizes.spacingXs / 2),
                    Text(
                      AppCurrencyFormatter.formatMileage(
                        record.mileage!,
                        record.distanceUnit.label,
                      ),
                      maxLines: 1,
                      softWrap: false,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.repairsMileageBlue,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ],
              ),
              SizedBox(width: AppSizes.spacingSm),
              Expanded(
                child: Text(
                  record.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Text(
                AppCurrencyFormatter.formatAmount(record.totalAmount),
                maxLines: 1,
                softWrap: false,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.reportsPapersGreen,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
