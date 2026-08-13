import 'package:deskcar/core/database/app_database.dart';
import 'package:deskcar/core/errors/app_result.dart';
import 'package:deskcar/features/repairs/data/mappers/service_record_mapper.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/features/repairs/domain/repositories/service_record_repository.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ServiceRecordRepository)
class ServiceRecordRepositoryImpl implements ServiceRecordRepository {
  ServiceRecordRepositoryImpl(this._database);

  final AppDatabase _database;

  @override
  Stream<List<ServiceRecordEntity>> watchAllRecords() {
    return (_database.select(_database.serviceRecordsTable)
          ..orderBy([
            (record) => OrderingTerm.desc(record.serviceDate),
          ]))
        .watch()
        .map((rows) => rows.map((row) => row.toEntity()).toList());
  }

  @override
  AppAsyncResult<List<ServiceRecordEntity>> getAllRecords() {
    return runAppResult(() async {
      final rows = await (_database.select(_database.serviceRecordsTable)
            ..orderBy([
              (record) => OrderingTerm.desc(record.serviceDate),
            ]))
          .get();

      return rows.map((row) => row.toEntity()).toList();
    });
  }

  @override
  AppAsyncResult<ServiceRecordEntity> createRecord(
    ServiceRecordEntity record,
  ) {
    return runAppResult(() async {
      await _database
          .into(_database.serviceRecordsTable)
          .insert(record.toCompanion());
      return record;
    });
  }
}
