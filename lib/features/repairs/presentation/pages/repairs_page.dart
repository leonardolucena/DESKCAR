import 'package:deskcar/components/app_main_shell.dart';
import 'package:deskcar/features/garage/presentation/pages/placeholder_tab_page.dart';
import 'package:flutter/material.dart';

class RepairsPage extends StatelessWidget {
  const RepairsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShellPage(
      title: 'Reparos',
      body: PlaceholderTabPage(
        title: 'Reparos e manutenção',
        message:
            'Registre consertos, troca de óleo, peças e mão de obra do seu carro.',
        icon: Icons.build_outlined,
      ),
    );
  }
}
