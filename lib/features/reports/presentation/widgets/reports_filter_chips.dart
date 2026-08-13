import 'package:deskcar/components/segmented_control.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:deskcar/features/reports/domain/entities/reports_period.dart';
import 'package:flutter/material.dart';

class ReportsFilterChips extends StatelessWidget {
  const ReportsFilterChips({
    super.key,
    required this.vehicleType,
    required this.period,
    required this.vehicles,
    required this.selectedVehicleId,
    required this.onVehicleTypeChanged,
    required this.onVehicleSelected,
    required this.onPeriodChanged,
  });

  final VehicleType vehicleType;
  final ReportsPeriod period;
  final List<VehicleEntity> vehicles;
  final String? selectedVehicleId;
  final ValueChanged<VehicleType> onVehicleTypeChanged;
  final ValueChanged<String> onVehicleSelected;
  final ValueChanged<ReportsPeriod> onPeriodChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSegmentedControl<VehicleType>(
          selected: vehicleType,
          onSelected: onVehicleTypeChanged,
          segments: const [
            AppSegmentedControlSegment(
              value: VehicleType.car,
              label: 'carro',
            ),
            AppSegmentedControlSegment(
              value: VehicleType.motorcycle,
              label: 'moto',
            ),
            AppSegmentedControlSegment(
              value: VehicleType.other,
              label: 'outra',
            ),
          ],
        ),
        if (vehicles.isNotEmpty) ...[
          SizedBox(height: AppSizes.spacingSm),
          AppSegmentedControl<String>(
            selected: selectedVehicleId ?? vehicles.first.id,
            onSelected: onVehicleSelected,
            segments: [
              for (final vehicle in vehicles)
                AppSegmentedControlSegment(
                  value: vehicle.id,
                  label: vehicle.displayName,
                ),
            ],
          ),
        ],
        SizedBox(height: AppSizes.spacingSm),
        AppSegmentedControl<ReportsPeriod>(
          selected: period,
          onSelected: onPeriodChanged,
          segments: const [
            AppSegmentedControlSegment(
              value: ReportsPeriod.allTime,
              label: 'Completo',
            ),
            AppSegmentedControlSegment(
              value: ReportsPeriod.thisYear,
              label: 'este ano',
            ),
            AppSegmentedControlSegment(
              value: ReportsPeriod.oneYear,
              label: '1 ano',
            ),
            AppSegmentedControlSegment(
              value: ReportsPeriod.twoYears,
              label: '2 anos',
            ),
          ],
        ),
      ],
    );
  }
}
