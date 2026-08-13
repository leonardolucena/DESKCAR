import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/features/repairs/presentation/cubit/repairs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RepairsCubit extends Cubit<RepairsState> {
  RepairsCubit() : super(const RepairsState.initial());

  Future<void> load() async {
    emit(state.copyWith(status: RepairsStatus.loading, errorMessage: null));

    // Dados de exemplo — será substituído pelo repositório Drift na próxima fase.
    await Future<void>.delayed(const Duration(milliseconds: 200));

    emit(
      state.copyWith(
        status: RepairsStatus.loaded,
        records: _sampleRecords,
      ),
    );
  }

  static final List<ServiceRecordEntity> _sampleRecords = [
    ServiceRecordEntity(
      id: '1',
      vehicleId: 'demo',
      title: 'Manutenção periódica',
      category: RepairCategory.maintenance,
      serviceDate: DateTime(2026, 1, 24),
      mileage: 62437,
      totalAmount: 1105,
      laborAmount: 250,
      partsAmount: 320,
      distanceUnit: DistanceUnit.km,
    ),
    ServiceRecordEntity(
      id: '2',
      vehicleId: 'demo',
      title: 'Óleo com filtro',
      category: RepairCategory.oil,
      serviceDate: DateTime(2025, 10, 12),
      mileage: 59800,
      totalAmount: 420,
      laborAmount: 80,
      partsAmount: 280,
      distanceUnit: DistanceUnit.km,
    ),
    ServiceRecordEntity(
      id: '3',
      vehicleId: 'demo',
      title: 'Limpadores',
      category: RepairCategory.wipers,
      serviceDate: DateTime(2025, 8, 3),
      mileage: 57120,
      totalAmount: 95,
      laborAmount: 25,
      partsAmount: 70,
      distanceUnit: DistanceUnit.km,
    ),
    ServiceRecordEntity(
      id: '4',
      vehicleId: 'demo',
      title: 'Suspensão',
      category: RepairCategory.suspension,
      serviceDate: DateTime(2025, 5, 18),
      mileage: 54200,
      totalAmount: 890,
      laborAmount: 320,
      partsAmount: 510,
      distanceUnit: DistanceUnit.km,
    ),
    ServiceRecordEntity(
      id: '5',
      vehicleId: 'demo',
      title: 'Elétrica',
      category: RepairCategory.electrical,
      serviceDate: DateTime(2025, 2, 7),
      mileage: 50100,
      totalAmount: 340,
      laborAmount: 150,
      partsAmount: 190,
      distanceUnit: DistanceUnit.km,
    ),
  ];
}
