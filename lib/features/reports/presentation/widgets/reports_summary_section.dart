import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/theme/app_colors.dart';
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
                valueColor: AppColors.reportsAccessoriesPurple,
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
        SizedBox(height: AppSizes.spacingSm),
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
                valueColor: AppColors.reportsTotalBlue,
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
        horizontal: AppSizes.cardPadding,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundCardLight,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        border: Border.all(color: AppColors.reportsChartBorder),
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
                style: theme.titleMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spacingSm),
          SizedBox(
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                formattedAmount,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: theme.headlineSmall?.copyWith(
                  fontSize: 16,
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
