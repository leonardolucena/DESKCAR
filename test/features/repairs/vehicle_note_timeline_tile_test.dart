import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/features/repairs/presentation/widgets/vehicle_note_timeline_tile.dart';
import 'package:deskcar/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('pt_BR');
  });

  final sampleRecord = ServiceRecordEntity(
    id: '1',
    vehicleId: 'demo',
    title: 'Abastecimento',
    categoryKey: RepairCategory.oil.name,
    serviceDate: DateTime(2026, 5, 22),
    mileage: 20406,
    totalAmount: 123,
    laborAmount: 0,
    partsAmount: 123,
    distanceUnit: DistanceUnit.km,
    notes: 'Posto de combustível',
    recordType: ServiceRecordType.repair,
    createdAt: DateTime(2026, 5, 22),
    updatedAt: DateTime(2026, 5, 22),
  );

  testWidgets('VehicleNoteTimelineTile shows timeline layout fields', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            home: Scaffold(
              body: VehicleNoteTimelineTile(
                record: sampleRecord,
                showTopRail: false,
                showBottomRail: true,
              ),
            ),
          );
        },
      ),
    );

    expect(find.text('Abastecimento'), findsOneWidget);
    expect(find.text('Posto de combustível'), findsOneWidget);
    expect(
      find.text(AppDateFormatter.formatShortDayMonth(sampleRecord.serviceDate)),
      findsOneWidget,
    );
    expect(
      find.text(AppCurrencyFormatter.formatAmountWithCents(123)),
      findsOneWidget,
    );
  });
}
