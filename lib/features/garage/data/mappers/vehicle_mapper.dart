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
      vehicleType: VehicleType.fromStorage(vehicleType),
      currentOdometer: currentOdometer,
      purchaseDate: purchaseDate,
      notes: notes,
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
      vehicleType: Value(vehicleType.storageValue),
      currentOdometer: Value(currentOdometer),
      purchaseDate: Value(purchaseDate),
      notes: Value(notes),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

class VehicleNameParser {
  const VehicleNameParser._();

  static ({String brand, String model, int? year}) parse(String rawName) {
    final trimmed = rawName.trim();
    final yearMatch = RegExp(r'\b(19|20)\d{2}\b').firstMatch(trimmed);

    if (yearMatch == null) {
      return (brand: trimmed, model: '', year: null);
    }

    final year = int.parse(yearMatch.group(0)!);
    final nameWithoutYear =
        trimmed.replaceAll(yearMatch.group(0)!, '').trim().replaceAll(RegExp(r'\s+'), ' ');

    return (brand: nameWithoutYear, model: '', year: year);
  }
}
