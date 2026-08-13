import 'package:deskcar/core/database/tables/vehicles_table.dart';
import 'package:drift/drift.dart';

class RemindersTable extends Table {
  TextColumn get id => text()();
  TextColumn get vehicleId =>
      text().references(VehiclesTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get type => text()();
  TextColumn get title => text().nullable()();
  DateTimeColumn get targetDate => dateTime().nullable()();
  RealColumn get targetMileage => real().nullable()();
  IntColumn get recurrenceMonths => integer().nullable()();
  RealColumn get recurrenceMileage => real().nullable()();
  DateTimeColumn get lastCompletedAt => dateTime().nullable()();
  RealColumn get lastCompletedMileage => real().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
