import 'package:deskcar/core/errors/app_result.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';

abstract interface class VehicleRepository {
  Stream<List<VehicleEntity>> watchAllVehicles();

  AppAsyncResult<List<VehicleEntity>> getAllVehicles();

  AppAsyncResult<VehicleEntity> createVehicle(VehicleEntity vehicle);
}
