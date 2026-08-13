import 'package:deskcar/components/app_main_shell.dart';
import 'package:deskcar/features/garage/presentation/pages/placeholder_tab_page.dart';
import 'package:flutter/material.dart';

class RemindersPage extends StatelessWidget {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShellPage(
      title: 'Lembretes',
      body: PlaceholderTabPage(
        title: 'Lembretes de manutenção',
        message:
            'Configure alertas por data ou quilometragem para não perder prazos.',
        icon: Icons.notifications_outlined,
      ),
    );
  }
}
