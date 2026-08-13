import 'package:drift/drift.dart';

class VehiclesTable extends Table {
  TextColumn get id => text()();
  TextColumn get brand => text()();
  TextColumn get model => text()();
  IntColumn get year => integer().nullable()();
  TextColumn get licensePlate => text().nullable()();
  TextColumn get coverPhotoPath => text().nullable()();
  TextColumn get distanceUnit => text()();
  RealColumn get currentOdometer => real().nullable()();
  DateTimeColumn get purchaseDate => dateTime().nullable()();
  TextColumn get vehicleType =>
      text().withDefault(const Constant('car'))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
