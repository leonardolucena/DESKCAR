import 'package:flutter/material.dart';
import 'package:deskcar/constants/app_assets.dart';
import 'package:deskcar/core/feedback/app_snackbar.dart';
import 'package:deskcar/theme/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const DeskCarApp());
}

class DeskCarApp extends StatelessWidget {
  const DeskCarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: AppBranding.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          scaffoldMessengerKey: AppSnackbar.messengerKey,
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppBranding.appName),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppBranding.slogan,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 2.h),
              Text(
                'Design system carregado.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
