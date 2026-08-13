import 'package:deskcar/components/app_main_shell.dart';
import 'package:deskcar/core/di/injection.dart';
import 'package:deskcar/core/router/app_page_transitions.dart';
import 'package:deskcar/core/router/app_routes.dart';
import 'package:deskcar/features/garage/presentation/cubit/garage_cubit.dart';
import 'package:deskcar/features/garage/presentation/pages/add_vehicle_page.dart';
import 'package:deskcar/features/garage/presentation/pages/car_detail_page.dart';
import 'package:deskcar/features/garage/presentation/pages/garage_page.dart';
import 'package:deskcar/features/papers/domain/entities/paper_document_category.dart';
import 'package:deskcar/features/papers/presentation/cubit/papers_cubit.dart';
import 'package:deskcar/features/papers/presentation/pages/add_document_page.dart';
import 'package:deskcar/features/papers/presentation/pages/papers_page.dart';
import 'package:deskcar/features/reminders/presentation/pages/reminders_page.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:deskcar/features/repairs/presentation/cubit/repairs_cubit.dart';
import 'package:deskcar/features/repairs/presentation/pages/add_service_page.dart';
import 'package:deskcar/features/repairs/presentation/pages/repairs_page.dart';
import 'package:deskcar/features/reports/presentation/cubit/reports_cubit.dart';
import 'package:deskcar/features/reports/presentation/pages/reports_page.dart';
import 'package:deskcar/features/settings/presentation/pages/settings_page.dart';
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
            path: AppRoutes.settings,
            pageBuilder: (context, state) => AppPageTransitions.tab(
              key: state.pageKey,
              child: const SettingsPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.repairs,
            pageBuilder: (context, state) => AppPageTransitions.tab(
              key: state.pageKey,
              child: BlocProvider(
                create: (_) => getIt<RepairsCubit>()..load(),
                child: const RepairsPage(),
              ),
            ),
          ),
          GoRoute(
            path: AppRoutes.papers,
            pageBuilder: (context, state) => AppPageTransitions.tab(
              key: state.pageKey,
              child: BlocProvider(
                create: (_) => getIt<PapersCubit>()..load(),
                child: const PapersPage(),
              ),
            ),
          ),
          GoRoute(
            path: AppRoutes.reminders,
            pageBuilder: (context, state) => AppPageTransitions.tab(
              key: state.pageKey,
              child: const RemindersPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.reports,
            pageBuilder: (context, state) => AppPageTransitions.tab(
              key: state.pageKey,
              child: BlocProvider(
                create: (_) => getIt<ReportsCubit>()..load(),
                child: const ReportsPage(),
              ),
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.addService,
        pageBuilder: (context, state) {
          final recordId = state.uri.queryParameters['id'];
          final categoryName =
              state.uri.queryParameters['category'] ?? RepairCategory.other.name;
          final category = RepairCategory.fromName(categoryName);

          return AppPageTransitions.modal(
            key: state.pageKey,
            child: AddServicePage(
              category: category,
              recordId: recordId,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.addDocument,
        pageBuilder: (context, state) {
          final recordId = state.uri.queryParameters['id'];
          final categoryName =
              state.uri.queryParameters['category'] ??
                  PaperDocumentCategory.other.name;
          final category = PaperDocumentCategory.fromName(categoryName);

          return AppPageTransitions.modal(
            key: state.pageKey,
            child: AddDocumentPage(
              category: category,
              recordId: recordId,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.addVehicle,
        pageBuilder: (context, state) => AppPageTransitions.modal(
          key: state.pageKey,
          child: const AddVehiclePage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.garage,
        pageBuilder: (context, state) => AppPageTransitions.push(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => getIt<GarageCubit>()..load(),
            child: const GaragePage(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.carDetail,
        pageBuilder: (context, state) {
          final vehicleId = state.pathParameters['id']!;

          return AppPageTransitions.push(
            key: state.pageKey,
            child: CarDetailPage(vehicleId: vehicleId),
          );
        },
      ),
    ],
  );
}
