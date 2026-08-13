import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ServiceRecordListTile extends StatelessWidget {
  const ServiceRecordListTile({
    super.key,
    required this.record,
    this.onTap,
  });

  final ServiceRecordEntity record;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final category = record.category;

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
              _CategoryIcon(category: category),
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
              _CostColumn(record: record),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  const _CategoryIcon({required this.category});

  final RepairCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class _CostColumn extends StatelessWidget {
  const _CostColumn({required this.record});

  final ServiceRecordEntity record;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppCurrencyFormatter.formatAmount(record.totalAmount),
          maxLines: 1,
          softWrap: false,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.repairsTotalGreen,
                fontWeight: FontWeight.w800,
              ),
        ),
        SizedBox(height: AppSizes.spacingXs),
        _CostDetailRow(
          icon: Icons.back_hand_outlined,
          amount: record.laborAmount,
        ),
        SizedBox(height: AppSizes.spacingXs / 2),
        _CostDetailRow(
          icon: Icons.settings_outlined,
          amount: record.partsAmount,
        ),
      ],
    );
  }
}

class _CostDetailRow extends StatelessWidget {
  const _CostDetailRow({
    required this.icon,
    required this.amount,
  });

  final IconData icon;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 3.5.w,
          color: AppColors.repairsCostMuted,
        ),
        SizedBox(width: AppSizes.spacingXs / 2),
        Text(
          AppCurrencyFormatter.formatAmount(amount),
          maxLines: 1,
          softWrap: false,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.repairsCostMuted,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
