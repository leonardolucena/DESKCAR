import 'package:deskcar/core/errors/app_result.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';

abstract interface class ServiceRecordRepository {
  Stream<List<ServiceRecordEntity>> watchAllRecords();

  AppAsyncResult<List<ServiceRecordEntity>> getAllRecords();

  AppAsyncResult<ServiceRecordEntity> getRecordById(String id);

  AppAsyncResult<ServiceRecordEntity> createRecord(ServiceRecordEntity record);

  AppAsyncResult<ServiceRecordEntity> updateRecord(ServiceRecordEntity record);
}
