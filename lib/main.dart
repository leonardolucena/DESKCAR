import 'package:deskcar/app.dart';
import 'package:deskcar/core/di/injection.dart';
import 'package:deskcar/core/router/app_router.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(
    DeskCarApp(
      router: getIt<AppRouter>().router,
    ),
  );
}
