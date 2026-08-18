import 'package:deskcar/components/app_bottom_nav_bar.dart';
import 'package:deskcar/core/navigation/app_bottom_nav_destination.dart';
import 'package:deskcar/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  testWidgets('AppBottomNavBar highlights selected destination', (
    WidgetTester tester,
  ) async {
    var selected = AppBottomNavDestination.repairs;

    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            home: StatefulBuilder(
              builder: (context, setState) {
                return Scaffold(
                  bottomNavigationBar: AppBottomNavBar(
                    current: selected,
                    onAddPressed: () {},
                    onDestinationSelected: (destination) {
                      setState(() {
                        selected = destination;
                      });
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );

    expect(find.text('Reparos'), findsOneWidget);
    expect(find.text('Papéis'), findsOneWidget);
    expect(find.text('Relatórios'), findsOneWidget);
    expect(find.text('Configurações'), findsOneWidget);
    expect(find.text('Lembretes'), findsNothing);
    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(find.text('Configurações'));
    await tester.pump();

    expect(selected, AppBottomNavDestination.settings);
  });
}
