import 'package:deskcar/core/router/app_routes.dart';
import 'package:flutter/material.dart';

enum AppBottomNavDestination {
  repairs(
    label: 'Reparos',
    icon: Icons.build_outlined,
    route: AppRoutes.repairs,
  ),
  papers(
    label: 'Papéis',
    icon: Icons.assignment_outlined,
    route: AppRoutes.papers,
  ),
  reports(
    label: 'Relatórios',
    icon: Icons.show_chart_outlined,
    route: AppRoutes.reports,
  ),
  settings(
    label: 'Configurações',
    icon: Icons.settings_outlined,
    route: AppRoutes.settings,
  );

  const AppBottomNavDestination({
    required this.label,
    required this.icon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final String route;

  static AppBottomNavDestination? fromRoute(String location) {
    for (final destination in values) {
      if (location.startsWith(destination.route)) {
        return destination;
      }
    }

    return null;
  }
}
