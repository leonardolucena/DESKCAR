import 'package:deskcar/core/errors/app_result.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:deskcar/features/garage/domain/repositories/vehicle_repository.dart';
import 'package:deskcar/features/garage/presentation/cubit/garage_cubit.dart';
import 'package:deskcar/features/garage/presentation/pages/garage_page.dart';
import 'package:deskcar/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class _FakeVehicleRepository implements VehicleRepository {
  @override
  Future<AppResult<List<VehicleEntity>>> getAllVehicles() async {
    return appSuccess(const []);
  }

  @override
  Stream<List<VehicleEntity>> watchAllVehicles() {
    return Stream.value(const []);
  }

  @override
  Future<AppResult<VehicleEntity>> createVehicle(VehicleEntity vehicle) async {
    return appSuccess(vehicle);
  }
}

void main() {
  testWidgets('Garage page shows empty state', (WidgetTester tester) async {
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            home: BlocProvider(
              create: (_) => GarageCubit(_FakeVehicleRepository())..load(),
              child: const GaragePage(),
            ),
          );
        },
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Garagem'), findsOneWidget);
    expect(find.text('Sua garagem está vazia'), findsOneWidget);
  });
}
