import 'package:flutter_test/flutter_test.dart';
import 'package:deskcar/main.dart';

void main() {
  testWidgets('DeskCar app loads with branding', (WidgetTester tester) async {
    await tester.pumpWidget(const DeskCarApp());
    await tester.pumpAndSettle();

    expect(find.text('DeskCar'), findsOneWidget);
    expect(find.text('Design system carregado.'), findsOneWidget);
  });
}
