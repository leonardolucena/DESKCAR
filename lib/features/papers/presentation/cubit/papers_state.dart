import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:equatable/equatable.dart';

enum PapersStatus { initial, loading, loaded, error }

class PapersState extends Equatable {
  const PapersState({
    required this.status,
    this.records = const [],
    this.errorMessage,
  });

  const PapersState.initial() : this(status: PapersStatus.initial);

  final PapersStatus status;
  final List<ServiceRecordEntity> records;
  final String? errorMessage;

  PapersState copyWith({
    PapersStatus? status,
    List<ServiceRecordEntity>? records,
    String? errorMessage,
  }) {
    return PapersState(
      status: status ?? this.status,
      records: records ?? this.records,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, records, errorMessage];
}
