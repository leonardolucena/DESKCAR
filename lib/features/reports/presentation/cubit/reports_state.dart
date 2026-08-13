import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:deskcar/features/reports/domain/entities/reports_data.dart';
import 'package:deskcar/features/reports/domain/entities/reports_period.dart';
import 'package:equatable/equatable.dart';

enum ReportsStatus { initial, loading, loaded, error }

class ReportsState extends Equatable {
  const ReportsState({
    required this.status,
    this.hasLoadedOnce = false,
    this.vehicleType = VehicleType.car,
    this.period = ReportsPeriod.allTime,
    this.vehicles = const [],
    this.selectedVehicleId,
    this.data = ReportsData.empty,
    this.errorMessage,
  });

  const ReportsState.initial() : this(status: ReportsStatus.initial);

  final ReportsStatus status;
  final bool hasLoadedOnce;
  final VehicleType vehicleType;
  final ReportsPeriod period;
  final List<VehicleEntity> vehicles;
  final String? selectedVehicleId;
  final ReportsData data;
  final String? errorMessage;

  ReportsState copyWith({
    ReportsStatus? status,
    bool? hasLoadedOnce,
    VehicleType? vehicleType,
    ReportsPeriod? period,
    List<VehicleEntity>? vehicles,
    String? selectedVehicleId,
    bool clearSelectedVehicleId = false,
    ReportsData? data,
    String? errorMessage,
  }) {
    return ReportsState(
      status: status ?? this.status,
      hasLoadedOnce: hasLoadedOnce ?? this.hasLoadedOnce,
      vehicleType: vehicleType ?? this.vehicleType,
      period: period ?? this.period,
      vehicles: vehicles ?? this.vehicles,
      selectedVehicleId: clearSelectedVehicleId
          ? null
          : selectedVehicleId ?? this.selectedVehicleId,
      data: data ?? this.data,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        hasLoadedOnce,
        vehicleType,
        period,
        vehicles,
        selectedVehicleId,
        data,
        errorMessage,
      ];
}
