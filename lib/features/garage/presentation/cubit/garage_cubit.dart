import 'dart:async';

import 'package:deskcar/core/errors/failure_message_mapper.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:deskcar/features/garage/domain/repositories/vehicle_repository.dart';
import 'package:deskcar/features/garage/presentation/cubit/garage_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GarageCubit extends Cubit<GarageState> {
  GarageCubit(this._vehicleRepository) : super(const GarageState.initial());

  final VehicleRepository _vehicleRepository;
  StreamSubscription<List<VehicleEntity>>? _subscription;

  Future<void> load() async {
    emit(state.copyWith(status: GarageStatus.loading, errorMessage: null));

    final result = await _vehicleRepository.getAllVehicles();
    result.fold(
      (vehicles) => emit(
        state.copyWith(
          status: GarageStatus.loaded,
          vehicles: vehicles,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          status: GarageStatus.error,
          errorMessage: FailureMessageMapper.message(failure),
        ),
      ),
    );

    await _subscription?.cancel();
    _subscription = _vehicleRepository.watchAllVehicles().listen(
      (vehicles) {
        if (isClosed) {
          return;
        }

        emit(
          state.copyWith(
            status: GarageStatus.loaded,
            vehicles: vehicles,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
