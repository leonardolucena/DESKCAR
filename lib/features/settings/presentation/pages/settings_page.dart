import 'package:deskcar/components/segmented_control.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        padding: EdgeInsets.all(AppSizes.cardPadding),
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppSizes.cardPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(AppSizes.cardRadius),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Aparência',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: AppSizes.spacingSm),
                Text(
                  'Escolha o tema do aplicativo.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.7),
                      ),
                ),
                SizedBox(height: AppSizes.spacingMd),
                BlocBuilder<ThemeCubit, ThemeMode>(
                  builder: (context, themeMode) {
                    return AppSegmentedControl<ThemeMode>(
                      selected: themeMode,
                      onSelected: context.read<ThemeCubit>().setThemeMode,
                      segments: const [
                        AppSegmentedControlSegment(
                          value: ThemeMode.light,
                          label: 'Claro',
                        ),
                        AppSegmentedControlSegment(
                          value: ThemeMode.dark,
                          label: 'Escuro',
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
