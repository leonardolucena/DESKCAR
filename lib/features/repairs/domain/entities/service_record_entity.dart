import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:equatable/equatable.dart';

class ServiceRecordEntity extends Equatable {
  const ServiceRecordEntity({
    required this.id,
    required this.vehicleId,
    required this.title,
    required this.categoryKey,
    required this.serviceDate,
    this.mileage,
    required this.totalAmount,
    required this.partsAmount,
    required this.laborAmount,
    required this.distanceUnit,
    this.notes,
    this.supplierCodes,
    this.includeAccessoryCosts = false,
    required this.recordType,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String vehicleId;
  final String title;
  final String categoryKey;
  final DateTime serviceDate;
  final double? mileage;
  final double totalAmount;
  final double partsAmount;
  final double laborAmount;
  final DistanceUnit distanceUnit;
  final String? notes;
  final String? supplierCodes;
  final bool includeAccessoryCosts;
  final ServiceRecordType recordType;
  final DateTime createdAt;
  final DateTime updatedAt;

  RepairCategory get category => RepairCategory.fromName(categoryKey);

  @override
  List<Object?> get props => [
        id,
        vehicleId,
        title,
        categoryKey,
        serviceDate,
        mileage,
        totalAmount,
        partsAmount,
        laborAmount,
        distanceUnit,
        notes,
        supplierCodes,
        includeAccessoryCosts,
        recordType,
        createdAt,
        updatedAt,
      ];
}
