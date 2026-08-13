import 'package:deskcar/components/app_main_shell.dart';
import 'package:deskcar/core/di/injection.dart';
import 'package:deskcar/core/router/app_routes.dart';
import 'package:deskcar/features/garage/presentation/cubit/garage_cubit.dart';
import 'package:deskcar/features/garage/presentation/pages/car_detail_page.dart';
import 'package:deskcar/features/garage/presentation/pages/garage_page.dart';
import 'package:deskcar/features/papers/presentation/pages/papers_page.dart';
import 'package:deskcar/features/reminders/presentation/pages/reminders_page.dart';
import 'package:deskcar/features/repairs/presentation/pages/repairs_page.dart';
import 'package:deskcar/features/reports/presentation/pages/reports_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppRouter {
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.repairs,
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppMainShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.repairs,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: RepairsPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.papers,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PapersPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.reminders,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: RemindersPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.reports,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ReportsPage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.garage,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<GarageCubit>()..load(),
          child: const GaragePage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.carDetail,
        builder: (context, state) {
          final vehicleId = state.pathParameters['id']!;

          return CarDetailPage(vehicleId: vehicleId);
        },
      ),
    ],
  );
}
