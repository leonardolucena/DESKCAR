import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:deskcar/features/repairs/presentation/widgets/select_service_bottom_sheet.dart';
import 'package:deskcar/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  testWidgets('SelectServiceBottomSheet filters services by search', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            home: Builder(
              builder: (context) {
                return Scaffold(
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showSelectServiceBottomSheet(context);
                      },
                      child: const Text('Open'),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.text('Selecione o serviço'), findsOneWidget);
    expect(find.text('Manutenção periódica'), findsOneWidget);
    expect(find.text('Óleo com filtro'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'freio');
    await tester.pump();

    expect(find.text('Pastilhas de freio'), findsOneWidget);
    expect(find.text('Fluido de freio'), findsOneWidget);
    expect(find.text('Manutenção periódica'), findsNothing);

    await tester.tap(find.text('Fluido de freio'));
    await tester.pumpAndSettle();

    expect(find.text('Selecione o serviço'), findsNothing);
  });

  test('RepairCategory.fromName resolves known values', () {
    expect(
      RepairCategory.fromName('oil'),
      RepairCategory.oil,
    );
    expect(
      RepairCategory.fromName('unknown'),
      RepairCategory.other,
    );
  });
}
