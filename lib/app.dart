import 'package:deskcar/constants/app_assets.dart';
import 'package:deskcar/core/feedback/app_snackbar.dart';
import 'package:deskcar/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:deskcar/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeskCarApp extends StatelessWidget {
  const DeskCarApp({
    super.key,
    required this.router,
  });

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return MaterialApp.router(
              title: AppBranding.appName,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeMode,
              locale: const Locale('pt', 'BR'),
              supportedLocales: const [
                Locale('pt', 'BR'),
              ],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              scaffoldMessengerKey: AppSnackbar.messengerKey,
              routerConfig: router,
            );
          },
        );
      },
    );
  }
}
