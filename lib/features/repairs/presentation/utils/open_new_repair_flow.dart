import 'package:deskcar/core/router/app_routes.dart';
import 'package:deskcar/features/repairs/presentation/widgets/select_service_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> openNewRepairFlow(BuildContext context) async {
  final selectedCategory = await showSelectServiceBottomSheet(context);
  if (!context.mounted || selectedCategory == null) {
    return;
  }

  context.push(AppRoutes.addServicePath(selectedCategory.name));
}
