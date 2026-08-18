import 'package:deskcar/core/errors/app_result.dart';
import 'package:deskcar/core/errors/app_failure.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:deskcar/features/garage/domain/repositories/vehicle_repository.dart';
import 'package:deskcar/features/reports/presentation/cubit/reports_cubit.dart';
import 'package:deskcar/features/reports/presentation/pages/reports_page.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/features/repairs/domain/repositories/service_record_repository.dart';
import 'package:deskcar/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class _FakeServiceRecordRepository implements ServiceRecordRepository {
  @override
  AppAsyncResult<ServiceRecordEntity> createRecord(ServiceRecordEntity record) {
    throw UnimplementedError();
  }

  @override
  AppAsyncResult<ServiceRecordEntity> getRecordById(String id) async {
    return appFailure(const NotFoundFailure());
  }

  @override
  AppAsyncResult<List<ServiceRecordEntity>> getAllRecords() async {
    return appSuccess(const []);
  }

  @override
  AppAsyncResult<ServiceRecordEntity> updateRecord(ServiceRecordEntity record) {
    throw UnimplementedError();
  }

  @override
  Stream<List<ServiceRecordEntity>> watchAllRecords() {
    return Stream.value(const []);
  }
}

class _FakeVehicleRepository implements VehicleRepository {
  @override
  AppAsyncResult<VehicleEntity> createVehicle(VehicleEntity vehicle) {
    throw UnimplementedError();
  }

  @override
  AppAsyncResult<List<VehicleEntity>> getAllVehicles() async {
    return appSuccess(const []);
  }

  @override
  Stream<List<VehicleEntity>> watchAllVehicles() {
    return Stream.value(const []);
  }
}

void main() {
  testWidgets('ReportsPage shows filters, summary cards and chart tabs', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            home: MediaQuery(
              data: const MediaQueryData(size: Size(800, 1200)),
              child: BlocProvider(
                create: (_) => ReportsCubit(
                  _FakeServiceRecordRepository(),
                  _FakeVehicleRepository(),
                )..load(),
                child: const ReportsPage(),
              ),
            ),
          );
        },
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Relatórios'), findsOneWidget);
    expect(find.text('carro'), findsOneWidget);
    expect(find.text('moto'), findsOneWidget);
    expect(find.text('outra'), findsNothing);
    expect(find.text('Completo'), findsOneWidget);
    expect(find.text('Total'), findsOneWidget);
    expect(find.text('Despesas'), findsOneWidget);
    expect(find.text('Categorias'), findsOneWidget);
    expect(find.text('Todas as despesas'), findsOneWidget);
    expect(find.text('Despesas por categoria'), findsNothing);
    expect(find.text('Quilometragem'), findsOneWidget);

    await tester.tap(find.text('Categorias'));
    await tester.pumpAndSettle();

    expect(find.text('Despesas por categoria'), findsOneWidget);
    expect(find.text('Todas as despesas'), findsNothing);
  });
}
