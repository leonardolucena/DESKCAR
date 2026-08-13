import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:equatable/equatable.dart';

enum GarageStatus { initial, loading, loaded, error }

class GarageState extends Equatable {
  const GarageState({
    required this.status,
    this.vehicles = const [],
    this.errorMessage,
  });

  const GarageState.initial() : this(status: GarageStatus.initial);

  final GarageStatus status;
  final List<VehicleEntity> vehicles;
  final String? errorMessage;

  GarageState copyWith({
    GarageStatus? status,
    List<VehicleEntity>? vehicles,
    String? errorMessage,
  }) {
    return GarageState(
      status: status ?? this.status,
      vehicles: vehicles ?? this.vehicles,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, vehicles, errorMessage];
}
