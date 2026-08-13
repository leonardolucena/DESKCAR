import 'package:deskcar/core/database/tables/vehicles_table.dart';
import 'package:drift/drift.dart';

class OdometerReadingsTable extends Table {
  TextColumn get id => text()();
  TextColumn get vehicleId =>
      text().references(VehiclesTable, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get recordedAt => dateTime()();
  RealColumn get mileage => real()();
  TextColumn get source => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
