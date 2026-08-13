import 'package:deskcar/app.dart';
import 'package:deskcar/core/di/injection.dart';
import 'package:deskcar/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR');
  await configureDependencies();

  runApp(
    DeskCarApp(
      router: getIt<AppRouter>().router,
    ),
  );
}
