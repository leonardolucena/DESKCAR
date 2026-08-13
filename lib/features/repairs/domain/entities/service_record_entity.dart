import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:equatable/equatable.dart';

class ServiceRecordEntity extends Equatable {
  const ServiceRecordEntity({
    required this.id,
    required this.vehicleId,
    required this.title,
    required this.category,
    required this.serviceDate,
    this.mileage,
    required this.totalAmount,
    required this.partsAmount,
    required this.laborAmount,
    required this.distanceUnit,
  });

  final String id;
  final String vehicleId;
  final String title;
  final RepairCategory category;
  final DateTime serviceDate;
  final double? mileage;
  final double totalAmount;
  final double partsAmount;
  final double laborAmount;
  final DistanceUnit distanceUnit;

  @override
  List<Object?> get props => [
        id,
        vehicleId,
        title,
        category,
        serviceDate,
        mileage,
        totalAmount,
        partsAmount,
        laborAmount,
        distanceUnit,
      ];
}
