import 'package:deskcar/components/paginated_staggered_list_view.dart';
import 'package:deskcar/components/states/app_empty_state.dart';
import 'package:deskcar/components/states/app_error_state.dart';
import 'package:deskcar/components/states/app_loading_state.dart';
import 'package:deskcar/core/feedback/app_snackbar.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/router/app_routes.dart';
import 'package:deskcar/features/garage/presentation/cubit/garage_cubit.dart';
import 'package:deskcar/features/garage/presentation/cubit/garage_state.dart';
import 'package:deskcar/features/garage/presentation/widgets/garage_app_bar.dart';
import 'package:deskcar/features/garage/presentation/widgets/vehicle_list_tile.dart';
import 'package:deskcar/theme/app_surface_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GaragePage extends StatelessWidget {
  const GaragePage({super.key});

  Future<void> _openAddVehicle(BuildContext context) async {
    await context.push(AppRoutes.addVehicle);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GarageCubit, GarageState>(
      builder: (context, state) {
        final hasVehicles =
            state.status == GarageStatus.loaded && state.vehicles.isNotEmpty;

        return Scaffold(
          backgroundColor: AppSurfaceColors.cardBackground(context),
          appBar: GarageAppBar(
            onSearchPressed: () {
              AppSnackbar.info(context, 'Busca em breve.');
            },
            onAddPressed: () => _openAddVehicle(context),
          ),
          body: switch (state.status) {
            GarageStatus.initial || GarageStatus.loading =>
              const AppLoadingState(itemCount: 2),
            GarageStatus.error => AppErrorState(
                message: state.errorMessage ?? 'Erro ao carregar a garagem.',
                onRetry: () => context.read<GarageCubit>().load(),
              ),
            GarageStatus.loaded => _GarageBody(
                state: state,
                listAnimationKey: Object.hashAll(
                  state.vehicles.map((vehicle) => vehicle.id),
                ),
                onAddPressed: () => _openAddVehicle(context),
              ),
          },
          floatingActionButton: hasVehicles
              ? FloatingActionButton(
                  backgroundColor: AppSurfaceColors.fabBackground(context),
                  foregroundColor: AppSurfaceColors.fabForeground(context),
                  onPressed: () => _openAddVehicle(context),
                  child: const Icon(Icons.add),
                )
              : null,
        );
      },
    );
  }
}

class _GarageBody extends StatelessWidget {
  const _GarageBody({
    required this.state,
    required this.listAnimationKey,
    required this.onAddPressed,
  });

  final GarageState state;
  final int listAnimationKey;
  final VoidCallback onAddPressed;

  @override
  Widget build(BuildContext context) {
    if (state.vehicles.isEmpty) {
      return AppEmptyState(
        title: 'Sua garagem está vazia',
        message: 'Adicione o primeiro veículo para começar a registrar despesas.',
        icon: Icons.directions_car_outlined,
        actionLabel: 'Adicionar veículo',
        onAction: onAddPressed,
      );
    }

    return AppPaginatedStaggeredListView(
      itemCount: state.vehicles.length,
      listAnimationKey: listAnimationKey,
      itemKeyBuilder: (index) => state.vehicles[index].id,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        thickness: 1,
        color: AppSurfaceColors.listDivider(context),
        indent: AppSizes.cardPadding,
        endIndent: AppSizes.cardPadding,
      ),
      itemBuilder: (context, index) {
        final vehicle = state.vehicles[index];

        return VehicleListTile(
          vehicle: vehicle,
          onTap: () => context.push(AppRoutes.carDetailPath(vehicle.id)),
        );
      },
    );
  }
}
