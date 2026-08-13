import 'package:deskcar/core/database/tables/service_records_table.dart';
import 'package:drift/drift.dart';

class ServiceAttachmentsTable extends Table {
  TextColumn get id => text()();
  TextColumn get serviceRecordId =>
      text().references(ServiceRecordsTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get filePath => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
