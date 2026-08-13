import 'package:deskcar/features/papers/presentation/widgets/select_document_bottom_sheet.dart';
import 'package:deskcar/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  testWidgets('SelectDocumentBottomSheet filters documents by search', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            home: const Scaffold(
              body: SelectDocumentBottomSheet(),
            ),
          );
        },
      ),
    );

    expect(find.text('Selecione o documento'), findsOneWidget);
    expect(find.text('Multa'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'seguro');
    await tester.pump();

    expect(find.text('Seguro'), findsOneWidget);
    expect(find.text('Seguro complexo'), findsOneWidget);
    expect(find.text('Multa'), findsNothing);
  });
}
