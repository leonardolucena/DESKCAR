import 'package:deskcar/core/preferences/theme_preferences.dart';
import 'package:deskcar/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:deskcar/features/settings/presentation/pages/settings_page.dart';
import 'package:deskcar/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('SettingsPage shows theme segmented control', (
    WidgetTester tester,
  ) async {
    final preferences = ThemePreferences(await SharedPreferences.getInstance());
    final themeCubit = ThemeCubit(preferences);

    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return BlocProvider.value(
            value: themeCubit,
            child: MaterialApp(
              theme: AppTheme.lightTheme,
              home: const SettingsPage(),
            ),
          );
        },
      ),
    );

    expect(find.text('Aparência'), findsOneWidget);
    expect(find.text('Claro'), findsOneWidget);
    expect(find.text('Escuro'), findsOneWidget);
  });
}
