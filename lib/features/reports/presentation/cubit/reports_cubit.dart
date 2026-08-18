import 'dart:async';

import 'package:deskcar/core/errors/failure_message_mapper.dart';
import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:deskcar/features/garage/domain/repositories/vehicle_repository.dart';
import 'package:deskcar/features/reports/domain/entities/reports_period.dart';
import 'package:deskcar/features/reports/domain/services/reports_data_builder.dart';
import 'package:deskcar/features/reports/presentation/cubit/reports_state.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/features/repairs/domain/repositories/service_record_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit(
    this._serviceRecordRepository,
    this._vehicleRepository,
  ) : super(const ReportsState.initial());

  final ServiceRecordRepository _serviceRecordRepository;
  final VehicleRepository _vehicleRepository;
  StreamSubscription<List<ServiceRecordEntity>>? _recordsSubscription;
  StreamSubscription<List<VehicleEntity>>? _vehiclesSubscription;

  List<VehicleEntity> _allVehicles = const [];
  List<ServiceRecordEntity> _allRecords = const [];

  Future<void> load() async {
    if (!state.hasLoadedOnce) {
      emit(state.copyWith(status: ReportsStatus.loading, errorMessage: null));
    }

    final vehiclesFuture = _vehicleRepository.getAllVehicles();
    final recordsFuture = _serviceRecordRepository.getAllRecords();
    final vehiclesResult = await vehiclesFuture;
    final recordsResult = await recordsFuture;

    if (isClosed) {
      return;
    }

    final failure = vehiclesResult.fold(
      (_) => recordsResult.fold((_) => null, (error) => error),
      (error) => error,
    );

    if (failure != null) {
      emit(
        state.copyWith(
          status: ReportsStatus.error,
          errorMessage: FailureMessageMapper.message(failure),
        ),
      );
      return;
    }

    _allVehicles = vehiclesResult.getOrNull() ?? const [];
    _allRecords = recordsResult.getOrNull() ?? const [];

    _recompute(hasLoadedOnce: true);
    _listenForUpdates();
  }

  void setVehicleType(VehicleType vehicleType) {
    if (state.vehicleType == vehicleType) {
      return;
    }

    emit(
      state.copyWith(
        vehicleType: vehicleType,
        clearSelectedVehicleId: true,
      ),
    );
    _recompute();
  }

  void setSelectedVehicle(String vehicleId) {
    if (state.selectedVehicleId == vehicleId) {
      return;
    }

    emit(state.copyWith(selectedVehicleId: vehicleId));
    _recompute();
  }

  void setPeriod(ReportsPeriod period) {
    if (state.period == period) {
      return;
    }

    emit(state.copyWith(period: period));
    _recompute();
  }

  void _listenForUpdates() {
    _recordsSubscription ??=
        _serviceRecordRepository.watchAllRecords().listen((records) {
      if (isClosed) {
        return;
      }

      _allRecords = records;
      _recompute();
    });

    _vehiclesSubscription ??=
        _vehicleRepository.watchAllVehicles().listen((vehicles) {
      if (isClosed) {
        return;
      }

      _allVehicles = vehicles;
      _recompute();
    });
  }

  void _recompute({bool hasLoadedOnce = false}) {
    final vehicleType = _resolveVehicleType(_allVehicles, state.vehicleType);
    final typeVehicles = ReportsDataBuilder.vehiclesForType(
      _allVehicles,
      vehicleType,
    );
    final selectedVehicleId = _resolveSelectedVehicleId(
      typeVehicles,
      state.selectedVehicleId,
      _allRecords,
    );
    final data = ReportsDataBuilder.build(
      allVehicles: _allVehicles,
      allRecords: _allRecords,
      vehicleType: vehicleType,
      period: state.period,
      vehicleId: selectedVehicleId,
    );

    emit(
      state.copyWith(
        status: ReportsStatus.loaded,
        hasLoadedOnce: hasLoadedOnce || state.hasLoadedOnce,
        vehicleType: vehicleType,
        vehicles: typeVehicles,
        selectedVehicleId: selectedVehicleId,
        clearSelectedVehicleId: selectedVehicleId == null,
        data: data,
      ),
    );
  }

  static const _reportVehicleTypes = [
    VehicleType.car,
    VehicleType.motorcycle,
  ];

  VehicleType _resolveVehicleType(
    List<VehicleEntity> allVehicles,
    VehicleType current,
  ) {
    if (_reportVehicleTypes.contains(current) &&
        ReportsDataBuilder.vehiclesForType(allVehicles, current).isNotEmpty) {
      return current;
    }

    for (final type in _reportVehicleTypes) {
      if (ReportsDataBuilder.vehiclesForType(allVehicles, type).isNotEmpty) {
        return type;
      }
    }

    return VehicleType.car;
  }

  String? _resolveSelectedVehicleId(
    List<VehicleEntity> vehicles,
    String? currentId,
    List<ServiceRecordEntity> records,
  ) {
    if (vehicles.isEmpty) {
      return null;
    }

    if (currentId != null && vehicles.any((vehicle) => vehicle.id == currentId)) {
      return currentId;
    }

    final vehicleIds = vehicles.map((vehicle) => vehicle.id).toSet();
    final recordsForType = records
        .where((record) => vehicleIds.contains(record.vehicleId))
        .toList(growable: false);

    if (recordsForType.isNotEmpty) {
      final counts = <String, int>{};
      for (final record in recordsForType) {
        counts[record.vehicleId] = (counts[record.vehicleId] ?? 0) + 1;
      }

      return recordsForType
          .map((record) => record.vehicleId)
          .fold<String>(
            recordsForType.first.vehicleId,
            (selected, vehicleId) =>
                (counts[vehicleId] ?? 0) > (counts[selected] ?? 0)
                    ? vehicleId
                    : selected,
          );
    }

    return vehicles.first.id;
  }

  @override
  Future<void> close() async {
    await _recordsSubscription?.cancel();
    await _vehiclesSubscription?.cancel();
    return super.close();
  }
}
