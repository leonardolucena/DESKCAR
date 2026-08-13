import 'package:deskcar/components/staggered_list_entrance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AppStaggeredListEntrance reveals child after delay', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppStaggeredListEntrance(
            index: 1,
            interval: Duration(milliseconds: 100),
            duration: Duration(milliseconds: 200),
            child: Text('Nota'),
          ),
        ),
      ),
    );

    expect(find.text('Nota'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pumpAndSettle();

    expect(find.text('Nota'), findsOneWidget);
  });

  testWidgets('AppStaggeredListEntrance shows child immediately when disabled', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppStaggeredListEntrance(
            index: 3,
            enabled: false,
            child: Text('Nota imediata'),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Nota imediata'), findsOneWidget);
  });
}
