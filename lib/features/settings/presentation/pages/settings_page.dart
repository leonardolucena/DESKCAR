import 'package:deskcar/features/garage/presentation/pages/placeholder_tab_page.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCardLight,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Configurações',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: const PlaceholderTabPage(
        title: 'Configurações do app',
        message: 'Preferências, unidades, backup e outras opções em breve.',
        icon: Icons.settings_outlined,
      ),
    );
  }
}
