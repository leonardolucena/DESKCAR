import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:equatable/equatable.dart';

class ReminderEntity extends Equatable {
  const ReminderEntity({
    required this.id,
    required this.vehicleId,
    required this.type,
    this.title,
    this.recurrenceMonths,
    this.recurrenceMileage,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String vehicleId;
  final ReminderType type;
  final String? title;
  final int? recurrenceMonths;
  final double? recurrenceMileage;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        vehicleId,
        type,
        title,
        recurrenceMonths,
        recurrenceMileage,
        createdAt,
        updatedAt,
      ];
}
