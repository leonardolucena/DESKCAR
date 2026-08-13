import 'package:deskcar/core/database/app_database.dart';
import 'package:deskcar/core/errors/app_result.dart';
import 'package:deskcar/features/garage/data/mappers/vehicle_mapper.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:deskcar/features/garage/domain/repositories/vehicle_repository.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: VehicleRepository)
class VehicleRepositoryImpl implements VehicleRepository {
  VehicleRepositoryImpl(this._database);

  final AppDatabase _database;

  @override
  Stream<List<VehicleEntity>> watchAllVehicles() {
    return (_database.select(_database.vehiclesTable)
          ..orderBy([
            (vehicle) => OrderingTerm.desc(vehicle.updatedAt),
          ]))
        .watch()
        .map((rows) => rows.map((row) => row.toEntity()).toList());
  }

  @override
  AppAsyncResult<List<VehicleEntity>> getAllVehicles() {
    return runAppResult(() async {
      final rows = await (_database.select(_database.vehiclesTable)
            ..orderBy([
              (vehicle) => OrderingTerm.desc(vehicle.updatedAt),
            ]))
          .get();

      return rows.map((row) => row.toEntity()).toList();
    });
  }
}
