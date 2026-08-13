import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:flutter/material.dart';

class VehicleListTile extends StatelessWidget {
  const VehicleListTile({
    super.key,
    required this.vehicle,
    required this.onTap,
  });

  final VehicleEntity vehicle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
            children: [
              Icon(
                Icons.directions_car_filled_outlined,
                size: AppSizes.iconLg,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(width: AppSizes.spacingMd),
              Expanded(
                child: Text(
                  vehicle.displayName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: AppSizes.spacingSm),
              Text(
                AppDateFormatter.formatDayMonthYear(vehicle.listDate),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
