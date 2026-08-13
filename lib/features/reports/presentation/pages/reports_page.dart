import 'package:deskcar/components/app_main_shell.dart';
import 'package:deskcar/features/garage/presentation/pages/placeholder_tab_page.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShellPage(
      title: 'Relatórios',
      body: PlaceholderTabPage(
        title: 'Relatórios de despesas',
        message:
            'Veja gráficos de gastos por mês, ano e categoria do seu veículo.',
        icon: Icons.show_chart_outlined,
      ),
    );
  }
}
