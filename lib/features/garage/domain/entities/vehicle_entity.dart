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
    this.currentOdometer,
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
  final double? currentOdometer;
  final DateTime createdAt;
  final DateTime updatedAt;

  String get displayName {
    final yearLabel = year != null ? '$year ' : '';
    return '$yearLabel$brand $model'.trim();
  }

  @override
  List<Object?> get props => [
        id,
        brand,
        model,
        year,
        licensePlate,
        coverPhotoPath,
        distanceUnit,
        currentOdometer,
        createdAt,
        updatedAt,
      ];
}
