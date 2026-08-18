import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:flutter/material.dart';

class VehicleNoteUpcomingEntry {
  const VehicleNoteUpcomingEntry({
    required this.title,
    required this.targetDate,
    required this.daysUntil,
    this.mileage,
    required this.distanceUnit,
    required this.icon,
    required this.iconColor,
  });

  final String title;
  final DateTime targetDate;
  final int daysUntil;
  final double? mileage;
  final DistanceUnit distanceUnit;
  final IconData icon;
  final Color iconColor;
}

VehicleNoteUpcomingEntry? resolveFuelUpcomingEntry(
  List<ServiceRecordEntity> records,
) {
  final fuelRecords = records.where((record) {
    final title = record.title.toLowerCase();
    return title.contains('abastec') || title.contains('combust');
  }).toList()
    ..sort((a, b) => b.serviceDate.compareTo(a.serviceDate));

  if (fuelRecords.isEmpty) {
    return null;
  }

  final lastRecord = fuelRecords.first;
  const intervalDays = 30;
  final targetDate = DateTime(
    lastRecord.serviceDate.year,
    lastRecord.serviceDate.month,
    lastRecord.serviceDate.day,
  ).add(const Duration(days: intervalDays));

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final daysUntil = targetDate.difference(today).inDays;

  if (daysUntil > 90) {
    return null;
  }

  double? projectedMileage = lastRecord.mileage;
  if (fuelRecords.length >= 2 &&
      lastRecord.mileage != null &&
      fuelRecords[1].mileage != null) {
    final delta = lastRecord.mileage! - fuelRecords[1].mileage!;
    if (delta > 0) {
      projectedMileage = lastRecord.mileage! + delta;
    }
  }

  return VehicleNoteUpcomingEntry(
    title: 'Próximo abastecimento',
    targetDate: targetDate,
    daysUntil: daysUntil,
    mileage: projectedMileage,
    distanceUnit: lastRecord.distanceUnit,
    icon: Icons.local_gas_station_outlined,
    iconColor: const Color(0xFFE65100),
  );
}
