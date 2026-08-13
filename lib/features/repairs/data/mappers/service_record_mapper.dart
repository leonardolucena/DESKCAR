import 'package:deskcar/core/database/app_database.dart';
import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:drift/drift.dart';

extension ServiceRecordRowMapper on ServiceRecordsTableData {
  ServiceRecordEntity toEntity() {
    return ServiceRecordEntity(
      id: id,
      vehicleId: vehicleId,
      title: title,
      categoryKey: category,
      serviceDate: serviceDate,
      mileage: mileage,
      totalAmount: totalAmount,
      partsAmount: partsAmount,
      laborAmount: laborAmount,
      distanceUnit: DistanceUnit.fromStorage(distanceUnit),
      notes: notes,
      supplierCodes: supplierCodes,
      includeAccessoryCosts: includeAccessoryCosts,
      recordType: ServiceRecordType.fromStorage(type),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension ServiceRecordEntityMapper on ServiceRecordEntity {
  ServiceRecordsTableCompanion toCompanion() {
    return ServiceRecordsTableCompanion.insert(
      id: id,
      vehicleId: vehicleId,
      type: recordType.storageValue,
      title: title,
      notes: Value(notes),
      serviceDate: serviceDate,
      mileage: Value(mileage),
      totalAmount: totalAmount,
      partsAmount: Value(partsAmount),
      laborAmount: Value(laborAmount),
      category: Value(categoryKey),
      distanceUnit: Value(distanceUnit.storageValue),
      includeAccessoryCosts: Value(includeAccessoryCosts),
      supplierCodes: Value(supplierCodes),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  ServiceRecordsTableCompanion toUpdateCompanion() {
    return ServiceRecordsTableCompanion(
      vehicleId: Value(vehicleId),
      type: Value(recordType.storageValue),
      title: Value(title),
      notes: Value(notes),
      serviceDate: Value(serviceDate),
      mileage: Value(mileage),
      totalAmount: Value(totalAmount),
      partsAmount: Value(partsAmount),
      laborAmount: Value(laborAmount),
      category: Value(categoryKey),
      distanceUnit: Value(distanceUnit.storageValue),
      includeAccessoryCosts: Value(includeAccessoryCosts),
      supplierCodes: Value(supplierCodes),
      updatedAt: Value(updatedAt),
    );
  }
}
