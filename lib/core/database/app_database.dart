import 'package:deskcar/core/database/database_connection.dart';
import 'package:deskcar/core/database/tables/odometer_readings_table.dart';
import 'package:deskcar/core/database/tables/reminders_table.dart';
import 'package:deskcar/core/database/tables/service_attachments_table.dart';
import 'package:deskcar/core/database/tables/service_records_table.dart';
import 'package:deskcar/core/database/tables/vehicles_table.dart';
import 'package:deskcar/core/storage/app_paths.dart';
import 'package:drift/drift.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    VehiclesTable,
    ServiceRecordsTable,
    ServiceAttachmentsTable,
    RemindersTable,
    OdometerReadingsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(AppPaths appPaths) : super(openDatabaseConnection(appPaths));

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
