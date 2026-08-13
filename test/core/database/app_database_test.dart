import 'package:deskcar/core/database/app_database.dart';
import 'package:deskcar/features/garage/data/mappers/vehicle_mapper.dart';
import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:deskcar/features/repairs/data/mappers/service_record_mapper.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;

  setUp(() async {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    await database.customStatement('PRAGMA foreign_keys = ON');
  });

  tearDown(() async {
    await database.close();
  });

  test('creates all tables and stores a vehicle', () async {
    final now = DateTime(2026, 8, 13);
    final vehicle = VehicleEntity(
      id: 'vehicle-1',
      brand: 'Toyota',
      model: 'Corolla',
      year: 2020,
      licensePlate: 'ABC1D23',
      distanceUnit: DistanceUnit.km,
      vehicleType: VehicleType.car,
      currentOdometer: 45000,
      createdAt: now,
      updatedAt: now,
    );

    await database.into(database.vehiclesTable).insert(vehicle.toCompanion());

    final rows = await database.select(database.vehiclesTable).get();
    expect(rows, hasLength(1));
    expect(rows.single.toEntity().displayName, 'Toyota Corolla 2020');
  });

  test('stores service record with extended fields', () async {
    final now = DateTime(2026, 8, 13);

    await database.into(database.vehiclesTable).insert(
          VehiclesTableCompanion.insert(
            id: 'vehicle-1',
            brand: 'Fox run',
            model: '',
            distanceUnit: DistanceUnit.km.storageValue,
            createdAt: now,
            updatedAt: now,
          ),
        );

    final record = ServiceRecordEntity(
      id: 'service-1',
      vehicleId: 'vehicle-1',
      title: 'Suspensão',
      categoryKey: RepairCategory.suspension.name,
      serviceDate: now,
      mileage: 54200,
      totalAmount: 890,
      laborAmount: 320,
      partsAmount: 510,
      distanceUnit: DistanceUnit.km,
      supplierCodes: 'ABC-123',
      includeAccessoryCosts: true,
      notes: 'Troca de amortecedores',
      recordType: ServiceRecordType.repair,
      createdAt: now,
      updatedAt: now,
    );

    await database.into(database.serviceRecordsTable).insert(record.toCompanion());

    final stored = await database.select(database.serviceRecordsTable).getSingle();
    final entity = stored.toEntity();

    expect(entity.title, 'Suspensão');
    expect(entity.category, RepairCategory.suspension);
    expect(entity.supplierCodes, 'ABC-123');
    expect(entity.includeAccessoryCosts, isTrue);
    expect(entity.notes, 'Troca de amortecedores');
  });

  test('deletes service records when vehicle is deleted', () async {
    final now = DateTime(2026, 8, 13);

    await database.into(database.vehiclesTable).insert(
          VehiclesTableCompanion.insert(
            id: 'vehicle-1',
            brand: 'Fiat',
            model: 'Uno',
            distanceUnit: DistanceUnit.km.storageValue,
            createdAt: now,
            updatedAt: now,
          ),
        );

    await database.into(database.serviceRecordsTable).insert(
          ServiceRecordsTableCompanion.insert(
            id: 'service-1',
            vehicleId: 'vehicle-1',
            type: ServiceRecordType.repair.storageValue,
            title: 'Troca de óleo',
            serviceDate: now,
            totalAmount: 250,
            createdAt: now,
            updatedAt: now,
          ),
        );

    await (database.delete(database.vehiclesTable)
          ..where((vehicle) => vehicle.id.equals('vehicle-1')))
        .go();

    final services = await database.select(database.serviceRecordsTable).get();
    expect(services, isEmpty);
  });
}
