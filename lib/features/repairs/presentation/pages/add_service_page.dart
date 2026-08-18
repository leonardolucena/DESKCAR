import 'package:deskcar/components/outline_button.dart';
import 'package:deskcar/components/states/app_loading_state.dart';
import 'package:deskcar/core/di/injection.dart';
import 'package:deskcar/core/errors/failure_message_mapper.dart';
import 'package:deskcar/core/feedback/app_snackbar.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:deskcar/features/garage/domain/repositories/vehicle_repository.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/features/repairs/domain/repositories/service_record_repository.dart';
import 'package:deskcar/features/repairs/presentation/widgets/add_service_form_field.dart';
import 'package:deskcar/theme/app_surface_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uuid/uuid.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({
    super.key,
    required this.category,
    this.recordId,
  });

  final RepairCategory category;
  final String? recordId;

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  static final _editableAmountFormat = NumberFormat('#,##0.##', 'pt_BR');
  static const _maxNameLength = 70;
  static const _maxSupplierCodesLength = 300;
  static const _maxCommentLength = 1000;
  static final _currencyInputFormatters = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
  ];

  final _nameController = TextEditingController();
  final _mileageController = TextEditingController();
  final _partsController = TextEditingController();
  final _laborController = TextEditingController();
  final _totalController = TextEditingController();
  final _supplierCodesController = TextEditingController();
  final _commentController = TextEditingController();

  DateTime _serviceDate = DateTime.now();
  late final _dateController = TextEditingController(
    text: AppDateFormatter.formatDayMonthYear(_serviceDate),
  );
  bool _includeAccessoryCosts = false;
  bool _isSaving = false;
  bool _isLoadingRecord = false;
  ServiceRecordEntity? _existingRecord;

  bool get _isEditing => widget.recordId != null;

  RepairCategory get _category =>
      _existingRecord?.category ?? widget.category;

  @override
  void initState() {
    super.initState();
    if (_isEditing) {
      _loadExistingRecord();
    } else {
      _nameController.text = widget.category.label;
    }
  }

  Future<void> _loadExistingRecord() async {
    setState(() => _isLoadingRecord = true);

    final result = await getIt<ServiceRecordRepository>().getRecordById(
      widget.recordId!,
    );

    if (!mounted) {
      return;
    }

    result.fold(
      (record) {
        _populateFromRecord(record);
        setState(() => _isLoadingRecord = false);
      },
      (failure) {
        setState(() => _isLoadingRecord = false);
        AppSnackbar.error(
          context,
          FailureMessageMapper.message(failure),
        );
        context.pop();
      },
    );
  }

  void _populateFromRecord(ServiceRecordEntity record) {
    _existingRecord = record;
    _nameController.text = record.title;
    _mileageController.text = record.mileage?.round().toString() ?? '';
    _serviceDate = record.serviceDate;
    _dateController.text = AppDateFormatter.formatDayMonthYear(record.serviceDate);
    _includeAccessoryCosts = record.includeAccessoryCosts;
    _partsController.text = _formatEditableAmount(record.partsAmount);
    _laborController.text = _formatEditableAmount(record.laborAmount);
    _totalController.text = _formatEditableAmount(record.totalAmount);
    _supplierCodesController.text = record.supplierCodes ?? '';
    _commentController.text = record.notes ?? '';
  }

  String _formatEditableAmount(double value) {
    if (value <= 0) {
      return '';
    }
    return _editableAmountFormat.format(value);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mileageController.dispose();
    _dateController.dispose();
    _partsController.dispose();
    _laborController.dispose();
    _totalController.dispose();
    _supplierCodesController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _serviceDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _serviceDate = picked;
        _dateController.text = AppDateFormatter.formatDayMonthYear(picked);
      });
    }
  }

  Future<void> _save() async {
    final title = _nameController.text.trim();
    if (title.isEmpty) {
      AppSnackbar.error(context, 'Informe o nome do serviço.');
      return;
    }

    setState(() => _isSaving = true);

    final vehicleId = _existingRecord?.vehicleId;
    final distanceUnit = _existingRecord?.distanceUnit;

    VehicleEntity? vehicle;
    if (!_isEditing) {
      final vehiclesResult = await getIt<VehicleRepository>().getAllVehicles();
      if (!mounted) {
        return;
      }

      vehicle = vehiclesResult.getOrNull()?.firstOrNull;
      if (vehicle == null) {
        setState(() => _isSaving = false);
        AppSnackbar.error(
          context,
          'Cadastre um veículo na garagem antes de adicionar uma nota.',
        );
        return;
      }
    }

    final partsAmount = AppCurrencyFormatter.parseAmount(_partsController.text) ?? 0;
    final laborAmount = AppCurrencyFormatter.parseAmount(_laborController.text) ?? 0;
    final parsedTotal = AppCurrencyFormatter.parseAmount(_totalController.text);
    final totalAmount = parsedTotal ?? (partsAmount + laborAmount);

    if (totalAmount <= 0) {
      setState(() => _isSaving = false);
      AppSnackbar.error(context, 'Informe o valor total do serviço.');
      return;
    }

    final mileageText = _mileageController.text.trim();
    final mileage = mileageText.isEmpty
        ? null
        : double.tryParse(mileageText.replaceAll('.', ''));

    final supplierCodes = _supplierCodesController.text.trim();
    final notes = _commentController.text.trim();
    final now = DateTime.now();

    final record = ServiceRecordEntity(
      id: _existingRecord?.id ?? const Uuid().v4(),
      vehicleId: vehicleId ?? vehicle!.id,
      title: title,
      categoryKey: _category.name,
      serviceDate: _serviceDate,
      mileage: mileage,
      totalAmount: totalAmount,
      partsAmount: partsAmount,
      laborAmount: laborAmount,
      distanceUnit: distanceUnit ?? vehicle!.distanceUnit,
      notes: notes.isEmpty ? null : notes,
      supplierCodes: supplierCodes.isEmpty ? null : supplierCodes,
      includeAccessoryCosts: _includeAccessoryCosts,
      recordType: _existingRecord?.recordType ?? ServiceRecordType.repair,
      createdAt: _existingRecord?.createdAt ?? now,
      updatedAt: now,
    );

    final repository = getIt<ServiceRecordRepository>();
    final result = _isEditing
        ? await repository.updateRecord(record)
        : await repository.createRecord(record);

    if (!mounted) {
      return;
    }

    setState(() => _isSaving = false);

    result.fold(
      (_) {
        AppSnackbar.success(
          context,
          _isEditing ? 'Serviço atualizado.' : 'Serviço salvo.',
        );
        context.pop();
      },
      (failure) => AppSnackbar.error(
        context,
        FailureMessageMapper.message(failure),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nameLength = _nameController.text.characters.length;
    final supplierCodesLength = _supplierCodesController.text.characters.length;
    final commentLength = _commentController.text.characters.length;

    return Scaffold(
      backgroundColor: AppSurfaceColors.formScreenBackground(context),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          tooltip: 'Fechar',
          onPressed: _isSaving ? null : () => context.pop(),
          icon: const Icon(Icons.close),
        ),
        title: Text(
          _isEditing ? 'Editar serviço' : 'Adicionar serviço',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        actions: [
          IconButton(
            tooltip: 'Salvar',
            onPressed: _isSaving ? null : _save,
            icon: _isSaving
                ? SizedBox(
                    width: AppSizes.iconMd,
                    height: AppSizes.iconMd,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                : const Icon(Icons.check),
          ),
        ],
      ),
      body: _isLoadingRecord
          ? const AppLoadingState(itemCount: 4)
          : SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _FormCard(
              children: [
                _IconSection(
                  category: _category,
                  onChangeImagePressed: () {
                    AppSnackbar.info(context, 'Seleção de imagem em breve.');
                  },
                ),
                SizedBox(height: AppSizes.spacingLg),
                AddServiceFormField(
                  controller: _nameController,
                  label: 'Insira o nome do serviço',
                  maxLength: _maxNameLength,
                  counterText: '$nameLength/$_maxNameLength',
                  onChanged: (_) => setState(() {}),
                ),
                SizedBox(height: AppSizes.formFieldSpacing),
                AddServiceFormField(
                  controller: _mileageController,
                  label: 'Quilometragem',
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(height: AppSizes.formFieldSpacing),
                AddServiceFormField(
                  label: 'Encontro',
                  readOnly: true,
                  onTap: _pickDate,
                  controller: _dateController,
                  suffixIcon: Icons.calendar_today_outlined,
                ),
                SizedBox(height: AppSizes.spacingLg),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Incluir como custos de acessórios',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Switch(
                      value: _includeAccessoryCosts,
                      activeThumbColor: AppSurfaceColors.cardBackground(context),
                      activeTrackColor:
                          AppSurfaceColors.switchActiveTrack(context),
                      onChanged: (value) {
                        setState(() => _includeAccessoryCosts = value);
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppSizes.spacingMd),
            _FormCard(
              children: [
                Text(
                  'Custos',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppSurfaceColors.formCostsHeader(context),
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: AppSizes.formFieldSpacing),
                AddServiceFormField(
                  controller: _partsController,
                  label: 'Peças',
                  fillColor: AppSurfaceColors.formCostFieldFill(context),
                  inputFormatters: _currencyInputFormatters,
                ),
                SizedBox(height: AppSizes.formFieldSpacing),
                AddServiceFormField(
                  controller: _laborController,
                  label: 'Trabalho',
                  fillColor: AppSurfaceColors.formCostFieldFill(context),
                  inputFormatters: _currencyInputFormatters,
                ),
                SizedBox(height: AppSizes.formFieldSpacing),
                AddServiceFormField(
                  controller: _totalController,
                  label: 'Total',
                  fillColor: AppSurfaceColors.formCostFieldFill(context),
                  inputFormatters: _currencyInputFormatters,
                ),
                SizedBox(height: AppSizes.spacingLg),
                AppOutlineButton(
                  label: 'ADICIONAR IMPOSTO OU DESCONTO',
                  fitSingleLine: true,
                  onPressed: () {
                    AppSnackbar.info(
                      context,
                      'Imposto ou desconto em breve.',
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: AppSizes.spacingMd),
            _FormCard(
              children: [
                AddServiceFormField(
                  controller: _supplierCodesController,
                  label: 'Códigos de fornecedor',
                  fillColor: AppSurfaceColors.formInfoFieldFill(context),
                  maxLength: _maxSupplierCodesLength,
                  counterText:
                      '$supplierCodesLength/$_maxSupplierCodesLength',
                  onChanged: (_) => setState(() {}),
                ),
                SizedBox(height: AppSizes.formFieldSpacing),
                AddServiceFormField(
                  controller: _commentController,
                  label: 'Comente',
                  fillColor: AppSurfaceColors.formInfoFieldFill(context),
                  maxLength: _maxCommentLength,
                  minLines: 4,
                  counterText: '$commentLength/$_maxCommentLength',
                  onChanged: (_) => setState(() {}),
                ),
                SizedBox(height: AppSizes.spacingLg),
                Center(
                  child: AppOutlineButton(
                    label: 'ANEXAR...',
                    expand: false,
                    onPressed: () {
                      AppSnackbar.info(context, 'Anexos em breve.');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  const _FormCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.cardPadding),
      decoration: BoxDecoration(
        color: AppSurfaceColors.cardBackground(context),
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}

class _IconSection extends StatelessWidget {
  const _IconSection({
    required this.category,
    required this.onChangeImagePressed,
  });

  final RepairCategory category;
  final VoidCallback onChangeImagePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 22.w,
          height: 22.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: category.iconBackgroundColor,
            borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          ),
          child: Icon(
            category.icon,
            size: AppSizes.iconLg,
            color: category.iconColor,
          ),
        ),
        SizedBox(height: AppSizes.spacingMd),
        Center(
          child: AppOutlineButton(
            label: 'ALTERAR IMAGEM...',
            expand: false,
            onPressed: onChangeImagePressed,
          ),
        ),
      ],
    );
  }
}
