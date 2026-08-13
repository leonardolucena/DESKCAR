import 'package:deskcar/core/errors/app_result.dart';
import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/reports/domain/entities/reports_data.dart';
import 'package:deskcar/features/reports/domain/entities/reports_period.dart';

abstract interface class ReportsRepository {
  AppAsyncResult<ReportsData> getReportsData({
    required VehicleType vehicleType,
    required ReportsPeriod period,
    String? vehicleId,
  });
}
