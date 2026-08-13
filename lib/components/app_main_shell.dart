import 'package:deskcar/components/app_bottom_nav_bar.dart';
import 'package:deskcar/core/navigation/app_bottom_nav_destination.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Envolve telas principais com a bottom bar reutilizável.
/// Use via [ShellRoute] no go_router ou manualmente quando precisar.
class AppMainShell extends StatelessWidget {
  const AppMainShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final currentDestination =
        AppBottomNavDestination.fromRoute(location) ??
            AppBottomNavDestination.repairs;

    return Column(
      children: [
        Expanded(child: child),
        AppBottomNavBar(
          current: currentDestination,
          onDestinationSelected: (destination) {
            if (destination == currentDestination) {
              return;
            }

            context.go(destination.route);
          },
        ),
      ],
    );
  }
}

/// Scaffold padrão para abas com bottom bar.
class AppShellPage extends StatelessWidget {
  const AppShellPage({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
  });

  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
