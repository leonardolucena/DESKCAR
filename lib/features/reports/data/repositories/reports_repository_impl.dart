import 'package:deskcar/core/errors/app_result.dart';
import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/garage/domain/repositories/vehicle_repository.dart';
import 'package:deskcar/features/reports/domain/entities/reports_data.dart';
import 'package:deskcar/features/reports/domain/entities/reports_period.dart';
import 'package:deskcar/features/reports/domain/repositories/reports_repository.dart';
import 'package:deskcar/features/reports/domain/services/reports_data_builder.dart';
import 'package:deskcar/features/repairs/domain/repositories/service_record_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ReportsRepository)
class ReportsRepositoryImpl implements ReportsRepository {
  ReportsRepositoryImpl(
    this._serviceRecordRepository,
    this._vehicleRepository,
  );

  final ServiceRecordRepository _serviceRecordRepository;
  final VehicleRepository _vehicleRepository;

  @override
  AppAsyncResult<ReportsData> getReportsData({
    required VehicleType vehicleType,
    required ReportsPeriod period,
    String? vehicleId,
  }) {
    return runAppResult(() async {
      final vehicles = (await _vehicleRepository.getAllVehicles()).getOrThrow();
      final records =
          (await _serviceRecordRepository.getAllRecords()).getOrThrow();

      return ReportsDataBuilder.build(
        allVehicles: vehicles,
        allRecords: records,
        vehicleType: vehicleType,
        period: period,
        vehicleId: vehicleId,
      );
    });
  }
}
