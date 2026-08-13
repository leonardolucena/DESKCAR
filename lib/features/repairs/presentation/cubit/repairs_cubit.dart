import 'dart:async';

import 'package:deskcar/core/errors/failure_message_mapper.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/features/repairs/domain/repositories/service_record_repository.dart';
import 'package:deskcar/features/repairs/presentation/cubit/repairs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RepairsCubit extends Cubit<RepairsState> {
  RepairsCubit(this._serviceRecordRepository) : super(const RepairsState.initial());

  final ServiceRecordRepository _serviceRecordRepository;
  StreamSubscription<List<ServiceRecordEntity>>? _subscription;

  Future<void> load() async {
    emit(state.copyWith(status: RepairsStatus.loading, errorMessage: null));

    final result = await _serviceRecordRepository.getAllRecords();
    result.fold(
      (records) => emit(
        state.copyWith(
          status: RepairsStatus.loaded,
          records: records,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          status: RepairsStatus.error,
          errorMessage: FailureMessageMapper.message(failure),
        ),
      ),
    );

    await _subscription?.cancel();
    _subscription = _serviceRecordRepository.watchAllRecords().listen(
      (records) {
        if (isClosed) {
          return;
        }

        emit(
          state.copyWith(
            status: RepairsStatus.loaded,
            records: records,
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
