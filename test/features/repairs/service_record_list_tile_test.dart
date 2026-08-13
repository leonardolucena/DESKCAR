import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/features/repairs/presentation/widgets/service_record_list_tile.dart';
import 'package:deskcar/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  final sampleRecord = ServiceRecordEntity(
    id: '1',
    vehicleId: 'demo',
    title: 'Manutenção periódica',
    categoryKey: RepairCategory.maintenance.name,
    serviceDate: DateTime(2026, 1, 24),
    mileage: 62437,
    totalAmount: 1105,
    laborAmount: 250,
    partsAmount: 320,
    distanceUnit: DistanceUnit.km,
    recordType: ServiceRecordType.repair,
    createdAt: DateTime(2026, 1, 24),
    updatedAt: DateTime(2026, 1, 24),
  );

  testWidgets('ServiceRecordListTile shows date, mileage and costs', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            home: Scaffold(
              body: ServiceRecordListTile(record: sampleRecord),
            ),
          );
        },
      ),
    );

    expect(find.text('24/01/2026'), findsOneWidget);
    expect(find.text('Manutenção periódica'), findsOneWidget);
    expect(
      find.text(AppCurrencyFormatter.formatMileage(62437, 'km')),
      findsOneWidget,
    );
    expect(
      find.text(AppCurrencyFormatter.formatAmount(1105)),
      findsOneWidget,
    );
  });
}
