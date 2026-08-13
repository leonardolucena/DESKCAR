import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:equatable/equatable.dart';

enum RepairsStatus { initial, loading, loaded, error }

class RepairsState extends Equatable {
  const RepairsState({
    required this.status,
    this.records = const [],
    this.errorMessage,
  });

  const RepairsState.initial() : this(status: RepairsStatus.initial);

  final RepairsStatus status;
  final List<ServiceRecordEntity> records;
  final String? errorMessage;

  RepairsState copyWith({
    RepairsStatus? status,
    List<ServiceRecordEntity>? records,
    String? errorMessage,
  }) {
    return RepairsState(
      status: status ?? this.status,
      records: records ?? this.records,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, records, errorMessage];
}
