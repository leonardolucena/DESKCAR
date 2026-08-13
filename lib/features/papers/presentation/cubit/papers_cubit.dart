import 'dart:async';

import 'package:deskcar/core/errors/failure_message_mapper.dart';
import 'package:deskcar/features/papers/domain/entities/paper_document_category.dart';
import 'package:deskcar/features/papers/presentation/cubit/papers_state.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/features/repairs/domain/repositories/service_record_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PapersCubit extends Cubit<PapersState> {
  PapersCubit(this._serviceRecordRepository) : super(const PapersState.initial());

  final ServiceRecordRepository _serviceRecordRepository;
  StreamSubscription? _subscription;

  Future<void> load() async {
    emit(state.copyWith(status: PapersStatus.loading, errorMessage: null));

    final result = await _serviceRecordRepository.getAllRecords();
    result.fold(
      (records) => emit(
        state.copyWith(
          status: PapersStatus.loaded,
          records: _paperRecords(records),
        ),
      ),
      (failure) => emit(
        state.copyWith(
          status: PapersStatus.error,
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
            status: PapersStatus.loaded,
            records: _paperRecords(records),
          ),
        );
      },
    );
  }

  List<ServiceRecordEntity> _paperRecords(List<ServiceRecordEntity> records) {
    return records.where(isPaperRecord).toList(growable: false);
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
