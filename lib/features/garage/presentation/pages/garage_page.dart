import 'package:deskcar/components/card.dart';
import 'package:deskcar/components/states/app_empty_state.dart';
import 'package:deskcar/components/states/app_error_state.dart';
import 'package:deskcar/components/states/app_loading_state.dart';
import 'package:deskcar/constants/app_assets.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/router/app_routes.dart';
import 'package:deskcar/features/garage/presentation/cubit/garage_cubit.dart';
import 'package:deskcar/features/garage/presentation/cubit/garage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GaragePage extends StatelessWidget {
  const GaragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppBranding.appName),
      ),
      body: BlocBuilder<GarageCubit, GarageState>(
        builder: (context, state) {
          return switch (state.status) {
            GarageStatus.initial || GarageStatus.loading => const AppLoadingState(
                itemCount: 2,
              ),
            GarageStatus.error => AppErrorState(
                message: state.errorMessage ?? 'Erro ao carregar a garagem.',
                onRetry: () => context.read<GarageCubit>().load(),
              ),
            GarageStatus.loaded => _GarageBody(state: state),
          };
        },
      ),
    );
  }
}

class _GarageBody extends StatelessWidget {
  const _GarageBody({required this.state});

  final GarageState state;

  @override
  Widget build(BuildContext context) {
    if (state.vehicles.isEmpty) {
      return AppEmptyState(
        title: 'Sua garagem está vazia',
        message:
            'Na próxima fase você poderá adicionar carros e começar a registrar despesas.',
        icon: Icons.directions_car_outlined,
      );
    }

    return ListView.separated(
      padding: EdgeInsets.all(AppSizes.cardPadding),
      itemCount: state.vehicles.length,
      separatorBuilder: (context, index) => SizedBox(height: AppSizes.spacingMd),
      itemBuilder: (context, index) {
        final vehicle = state.vehicles[index];
        return AppCard(
          onTap: () => context.push(AppRoutes.carDetailPath(vehicle.id)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vehicle.displayName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (vehicle.licensePlate != null) ...[
                SizedBox(height: AppSizes.spacingXs),
                Text(
                  vehicle.licensePlate!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
              SizedBox(height: AppSizes.spacingSm),
              Text(
                'Unidade: ${vehicle.distanceUnit.label}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        );
      },
    );
  }
}
