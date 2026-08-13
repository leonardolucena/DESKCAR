import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<RepairCategory?> showSelectServiceBottomSheet(BuildContext context) {
  return showModalBottomSheet<RepairCategory>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const SelectServiceBottomSheet(),
  );
}

class SelectServiceBottomSheet extends StatefulWidget {
  const SelectServiceBottomSheet({super.key});

  @override
  State<SelectServiceBottomSheet> createState() =>
      _SelectServiceBottomSheetState();
}

class _SelectServiceBottomSheetState extends State<SelectServiceBottomSheet> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<RepairCategory> get _filteredOptions {
    if (_query.trim().isEmpty) {
      return RepairCategory.selectableOptions;
    }

    final normalizedQuery = _query.trim().toLowerCase();
    return RepairCategory.selectableOptions
        .where(
          (option) => option.label.toLowerCase().contains(normalizedQuery),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final options = _filteredOptions;
    final sheetHeight = MediaQuery.sizeOf(context).height * 0.8;
    const sheetTopRadius = 28.0;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Container(
        height: sheetHeight,
        decoration: BoxDecoration(
          color: AppColors.backgroundCardLight,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(sheetTopRadius),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: AppSizes.spacingSm),
            Container(
              width: 10.w,
              height: 0.5.h,
              decoration: BoxDecoration(
                color: AppColors.repairsCostMuted,
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppSizes.cardPadding,
                AppSizes.spacingMd,
                AppSizes.cardPadding,
                AppSizes.spacingSm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Selecione o serviço',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(height: AppSizes.spacingMd),
                  TextField(
                    controller: _searchController,
                    onChanged: (value) => setState(() => _query = value),
                    decoration: InputDecoration(
                      hintText: 'Pesquisar...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: AppColors.backgroundLight,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSizes.inputPaddingH,
                        vertical: AppSizes.inputPaddingV,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppSizes.borderRadius),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppSizes.borderRadius),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppSizes.borderRadius),
                        borderSide: BorderSide(
                          color: AppColors.bottomNavActiveLight,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: options.isEmpty
                  ? Padding(
                      padding: EdgeInsets.all(AppSizes.cardPadding),
                      child: Text(
                        'Nenhum serviço encontrado.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.repairsCostMuted,
                            ),
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        left: AppSizes.cardPadding,
                        right: AppSizes.cardPadding,
                        bottom: AppSizes.spacingMd,
                      ),
                      itemCount: options.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: AppSizes.spacingSm),
                      itemBuilder: (context, index) {
                        final option = options[index];
                        return _ServiceOptionTile(
                          category: option,
                          onTap: () => Navigator.of(context).pop(option),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceOptionTile extends StatelessWidget {
  const _ServiceOptionTile({
    required this.category,
    required this.onTap,
  });

  final RepairCategory category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.spacingSm,
          ),
          child: Row(
            children: [
              Container(
                width: 12.w,
                height: 12.w,
                decoration: BoxDecoration(
                  color: category.iconBackgroundColor,
                  borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                ),
                child: Icon(
                  category.icon,
                  color: category.iconColor,
                  size: AppSizes.iconMd,
                ),
              ),
              SizedBox(width: AppSizes.spacingMd),
              Expanded(
                child: Text(
                  category.label,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
