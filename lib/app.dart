import 'package:deskcar/constants/app_assets.dart';
import 'package:deskcar/core/feedback/app_snackbar.dart';
import 'package:deskcar/theme/app_theme.dart';
import 'package:flutter/material.dart';
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
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          title: AppBranding.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          scaffoldMessengerKey: AppSnackbar.messengerKey,
          routerConfig: router,
        );
      },
    );
  }
}
