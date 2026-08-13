import 'package:deskcar/app.dart';
import 'package:deskcar/core/di/injection.dart';
import 'package:deskcar/core/router/app_router.dart';
import 'package:deskcar/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR');
  await configureDependencies();

  final themeCubit = getIt<ThemeCubit>();
  await themeCubit.load();

  runApp(
    BlocProvider.value(
      value: themeCubit,
      child: DeskCarApp(
        router: getIt<AppRouter>().router,
      ),
    ),
  );
}
