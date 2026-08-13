import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:equatable/equatable.dart';

class VehicleEntity extends Equatable {
  const VehicleEntity({
    required this.id,
    required this.brand,
    required this.model,
    this.year,
    this.licensePlate,
    this.coverPhotoPath,
    required this.distanceUnit,
    required this.vehicleType,
    this.currentOdometer,
    this.purchaseDate,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String brand;
  final String model;
  final int? year;
  final String? licensePlate;
  final String? coverPhotoPath;
  final DistanceUnit distanceUnit;
  final VehicleType vehicleType;
  final double? currentOdometer;
  final DateTime? purchaseDate;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  String get displayName {
    final baseName = model.isEmpty ? brand : '$brand $model'.trim();
    if (year != null && !baseName.contains('$year')) {
      return '$baseName $year'.trim();
    }
    return baseName;
  }

  DateTime get listDate => purchaseDate ?? createdAt;

  @override
  List<Object?> get props => [
        id,
        brand,
        model,
        year,
        licensePlate,
        coverPhotoPath,
        distanceUnit,
        vehicleType,
        currentOdometer,
        purchaseDate,
        notes,
        createdAt,
        updatedAt,
      ];
}
