import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:deskcar/features/reports/domain/entities/reports_data.dart';
import 'package:deskcar/features/reports/domain/entities/reports_period.dart';
import 'package:deskcar/features/reports/domain/services/reports_aggregator.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';

abstract final class ReportsDataBuilder {
  static List<VehicleEntity> vehiclesForType(
    List<VehicleEntity> allVehicles,
    VehicleType vehicleType,
  ) {
    return allVehicles
        .where((vehicle) => vehicle.vehicleType == vehicleType)
        .toList(growable: false);
  }

  static ReportsData build({
    required List<VehicleEntity> allVehicles,
    required List<ServiceRecordEntity> allRecords,
    required VehicleType vehicleType,
    required ReportsPeriod period,
    String? vehicleId,
  }) {
    final vehicleIds = <String>{};
    if (vehicleId != null) {
      vehicleIds.add(vehicleId);
    } else {
      vehicleIds.addAll(
        vehiclesForType(allVehicles, vehicleType).map((vehicle) => vehicle.id),
      );
    }

    if (vehicleIds.isEmpty) {
      return ReportsData.empty;
    }

    final filteredRecords = allRecords
        .where((record) => vehicleIds.contains(record.vehicleId))
        .toList(growable: false);

    return ReportsAggregator.aggregate(
      records: filteredRecords,
      period: period,
    );
  }
}
