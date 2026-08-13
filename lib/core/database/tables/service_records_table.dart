import 'package:deskcar/core/database/tables/vehicles_table.dart';
import 'package:drift/drift.dart';

class ServiceRecordsTable extends Table {
  TextColumn get id => text()();
  TextColumn get vehicleId =>
      text().references(VehiclesTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get type => text()();
  TextColumn get title => text()();
  TextColumn get providerName => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get serviceDate => dateTime()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  RealColumn get mileage => real().nullable()();
  RealColumn get totalAmount => real()();
  RealColumn get partsAmount => real().withDefault(const Constant(0))();
  RealColumn get laborAmount => real().withDefault(const Constant(0))();
  TextColumn get category => text().withDefault(const Constant('other'))();
  TextColumn get distanceUnit => text().withDefault(const Constant('km'))();
  BoolColumn get includeAccessoryCosts =>
      boolean().withDefault(const Constant(false))();
  TextColumn get supplierCodes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
