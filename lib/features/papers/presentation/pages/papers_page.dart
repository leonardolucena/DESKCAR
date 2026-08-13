import 'package:deskcar/components/app_main_shell.dart';
import 'package:deskcar/features/garage/presentation/pages/placeholder_tab_page.dart';
import 'package:flutter/material.dart';

class PapersPage extends StatelessWidget {
  const PapersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShellPage(
      title: 'Papéis',
      body: PlaceholderTabPage(
        title: 'Papéis e despesas',
        message:
            'Controle seguro, multas, impostos e outras despesas documentais.',
        icon: Icons.assignment_outlined,
      ),
    );
  }
}
