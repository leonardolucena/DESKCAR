import 'package:deskcar/core/database/app_database.dart';
import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/garage/domain/entities/reminder_entity.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:drift/drift.dart';

extension ReminderRowMapper on RemindersTableData {
  ReminderEntity toEntity() {
    return ReminderEntity(
      id: id,
      vehicleId: vehicleId,
      type: ReminderType.fromStorage(type),
      title: title,
      recurrenceMonths: recurrenceMonths,
      recurrenceMileage: recurrenceMileage,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension ReminderEntityMapper on ReminderEntity {
  RemindersTableCompanion toCompanion() {
    return RemindersTableCompanion.insert(
      id: id,
      vehicleId: vehicleId,
      type: type.storageValue,
      title: Value(title),
      recurrenceMonths: Value(recurrenceMonths),
      recurrenceMileage: Value(recurrenceMileage),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension RepairCategoryReminderMapper on RepairCategory {
  ReminderType toReminderType() {
    return switch (this) {
      RepairCategory.oil => ReminderType.oilChange,
      RepairCategory.engineAirFilter ||
      RepairCategory.cabinFilter ||
      RepairCategory.fuelFilter =>
        ReminderType.filters,
      RepairCategory.brakeFluid => ReminderType.brakeFluid,
      RepairCategory.tireChange ||
      RepairCategory.tireRepair ||
      RepairCategory.wheels =>
        ReminderType.tires,
      RepairCategory.maintenance => ReminderType.inspection,
      _ => ReminderType.custom,
    };
  }
}
