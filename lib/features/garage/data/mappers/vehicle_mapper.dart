import 'package:deskcar/core/database/app_database.dart';
import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:drift/drift.dart';

extension VehicleRowMapper on VehiclesTableData {
  VehicleEntity toEntity() {
    return VehicleEntity(
      id: id,
      brand: brand,
      model: model,
      year: year,
      licensePlate: licensePlate,
      coverPhotoPath: coverPhotoPath,
      distanceUnit: DistanceUnit.fromStorage(distanceUnit),
      currentOdometer: currentOdometer,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension VehicleEntityMapper on VehicleEntity {
  VehiclesTableCompanion toCompanion() {
    return VehiclesTableCompanion.insert(
      id: id,
      brand: brand,
      model: model,
      year: Value(year),
      licensePlate: Value(licensePlate),
      coverPhotoPath: Value(coverPhotoPath),
      distanceUnit: distanceUnit.storageValue,
      currentOdometer: Value(currentOdometer),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
