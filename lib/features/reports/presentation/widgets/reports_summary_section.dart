import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:deskcar/theme/app_surface_colors.dart';
import 'package:flutter/material.dart';

class ReportsSummarySection extends StatelessWidget {
  const ReportsSummarySection({
    super.key,
    this.accessoriesTotal = 0,
    this.repairsTotal = 0,
    this.papersTotal = 0,
  });

  final num accessoriesTotal;
  final num repairsTotal;
  final num papersTotal;

  num get total => accessoriesTotal + repairsTotal + papersTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _SummaryCard(
                label: 'Acessórios',
                amount: accessoriesTotal,
                valueColor: AppSurfaceColors.reportsAccessoriesAccent(context),
              ),
            ),
            SizedBox(width: AppSizes.spacingSm),
            Expanded(
              child: _SummaryCard(
                label: 'Reparos',
                amount: repairsTotal,
                valueColor: AppColors.reportsRepairsRed,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.spacingXs),
        Row(
          children: [
            Expanded(
              child: _SummaryCard(
                label: 'Papéis',
                amount: papersTotal,
                valueColor: AppColors.reportsPapersGreen,
              ),
            ),
            SizedBox(width: AppSizes.spacingSm),
            Expanded(
              child: _SummaryCard(
                label: 'Total',
                amount: total,
                valueColor: AppSurfaceColors.reportsTotalAccent(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.label,
    required this.amount,
    required this.valueColor,
  });

  final String label;
  final num amount;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final formattedAmount = AppCurrencyFormatter.formatAmount(amount);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.spacingSm,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppSurfaceColors.cardBackground(context),
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        border: Border.all(color: AppSurfaceColors.chartBorder(context)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: theme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spacingXs / 2),
          SizedBox(
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                formattedAmount,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: theme.labelLarge?.copyWith(
                  color: valueColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
