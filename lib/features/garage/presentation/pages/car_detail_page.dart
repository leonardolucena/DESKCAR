import 'package:deskcar/constants/app_assets.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CarDetailPage extends StatelessWidget {
  const CarDetailPage({
    super.key,
    required this.vehicleId,
  });

  final String vehicleId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe do veículo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppBranding.appName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: AppSizes.spacingSm),
            Text(
              'Veículo: $vehicleId',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 2.h),
            Text(
              'Serviços, despesas e lembretes serão implementados nas próximas fases.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
