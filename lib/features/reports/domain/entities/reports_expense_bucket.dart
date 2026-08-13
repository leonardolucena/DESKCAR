import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';

enum ReportsExpenseBucket {
  accessories,
  repairs,
  papers,
}

ReportsExpenseBucket? reportsBucketFor(ServiceRecordEntity record) {
  return switch (record.recordType) {
    ServiceRecordType.insurance ||
    ServiceRecordType.fine ||
    ServiceRecordType.tax =>
      ReportsExpenseBucket.papers,
    ServiceRecordType.repair when record.includeAccessoryCosts =>
      ReportsExpenseBucket.accessories,
    ServiceRecordType.repair => ReportsExpenseBucket.repairs,
    ServiceRecordType.fuel || ServiceRecordType.other =>
      ReportsExpenseBucket.repairs,
  };
}
