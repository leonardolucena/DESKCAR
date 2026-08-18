import 'package:deskcar/components/outline_button.dart';
import 'package:deskcar/components/states/app_loading_state.dart';
import 'package:deskcar/core/di/injection.dart';
import 'package:deskcar/core/errors/failure_message_mapper.dart';
import 'package:deskcar/core/feedback/app_snackbar.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:deskcar/features/garage/domain/repositories/vehicle_repository.dart';
import 'package:deskcar/features/papers/domain/entities/paper_document_category.dart';
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

class AddDocumentPage extends StatefulWidget {
  const AddDocumentPage({
    super.key,
    required this.category,
    this.recordId,
  });

  final PaperDocumentCategory category;
  final String? recordId;

  @override
  State<AddDocumentPage> createState() => _AddDocumentPageState();
}

class _AddDocumentPageState extends State<AddDocumentPage> {
  static final _editableAmountFormat = NumberFormat('#,##0.##', 'pt_BR');
  static const _maxNameLength = 70;
  static final _currencyInputFormatters = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
  ];

  final _nameController = TextEditingController();
  final _mileageController = TextEditingController();
  final _totalController = TextEditingController();

  DateTime _serviceDate = DateTime.now();
  late final _dateController = TextEditingController(
    text: AppDateFormatter.formatDayMonthYear(_serviceDate),
  );
  bool _isSaving = false;
  bool _isLoadingRecord = false;
  ServiceRecordEntity? _existingRecord;

  bool get _isEditing => widget.recordId != null;

  PaperDocumentCategory get _category =>
      _existingRecord == null
          ? widget.category
          : PaperDocumentCategory.fromRecord(_existingRecord!);

  @override
  void initState() {
    super.initState();
    if (_isEditing) {
      _loadExistingRecord();
    } else {
      _nameController.text = widget.category.label;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mileageController.dispose();
    _dateController.dispose();
    _totalController.dispose();
    super.dispose();
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
    _totalController.text = _formatEditableAmount(record.totalAmount);
  }

  String _formatEditableAmount(double value) {
    if (value <= 0) {
      return '';
    }
    return _editableAmountFormat.format(value);
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _serviceDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('pt', 'BR'),
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
      AppSnackbar.error(context, 'Informe o nome do documento.');
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
          'Cadastre um veículo na garagem antes de adicionar um documento.',
        );
        return;
      }
    }

    final parsedTotal = AppCurrencyFormatter.parseAmount(_totalController.text);
    if (parsedTotal == null || parsedTotal <= 0) {
      setState(() => _isSaving = false);
      AppSnackbar.error(context, 'Informe o custo total do documento.');
      return;
    }

    final mileageText = _mileageController.text.trim();
    final mileage = mileageText.isEmpty
        ? null
        : double.tryParse(mileageText.replaceAll('.', ''));
    final now = DateTime.now();

    final record = ServiceRecordEntity(
      id: _existingRecord?.id ?? const Uuid().v4(),
      vehicleId: vehicleId ?? vehicle!.id,
      title: title,
      categoryKey: _category.name,
      serviceDate: _serviceDate,
      mileage: mileage,
      totalAmount: parsedTotal,
      partsAmount: 0,
      laborAmount: 0,
      distanceUnit: distanceUnit ?? vehicle!.distanceUnit,
      recordType: _category.recordType,
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
          _isEditing ? 'Documento atualizado.' : 'Documento salvo.',
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
          _isEditing ? 'Editar documento' : 'Adicionar documento',
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
          ? const AppLoadingState(itemCount: 3)
          : SingleChildScrollView(
              padding: EdgeInsets.all(AppSizes.cardPadding),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(AppSizes.cardPadding),
                decoration: BoxDecoration(
                  color: AppSurfaceColors.cardBackground(context),
                  borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 22.w,
                          height: 22.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _category.iconBackgroundColor,
                            borderRadius:
                                BorderRadius.circular(AppSizes.cardRadius),
                          ),
                          child: Icon(
                            _category.icon,
                            size: AppSizes.iconLg,
                            color: _category.iconColor,
                          ),
                        ),
                        SizedBox(height: AppSizes.formFieldSpacing),
                        Center(
                          child: AppOutlineButton(
                            label: 'ALTERAR IMAGEM...',
                            expand: false,
                            onPressed: () {
                              AppSnackbar.info(
                                context,
                                'Seleção de imagem em breve.',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.spacingLg),
                    AddServiceFormField(
                      controller: _nameController,
                      label: 'Insira o nome do documento',
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
                    SizedBox(height: AppSizes.formFieldSpacing),
                    AddServiceFormField(
                      controller: _totalController,
                      label: 'Custo total',
                      fillColor: AppSurfaceColors.formCostFieldFill(context),
                      inputFormatters: _currencyInputFormatters,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
