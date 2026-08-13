import 'package:deskcar/components/outline_button.dart';
import 'package:deskcar/components/segmented_control.dart';
import 'package:deskcar/core/di/injection.dart';
import 'package:deskcar/core/errors/failure_message_mapper.dart';
import 'package:deskcar/core/feedback/app_snackbar.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/core/utils/formatters.dart';
import 'package:deskcar/features/garage/data/mappers/reminder_mapper.dart';
import 'package:deskcar/features/garage/data/mappers/vehicle_mapper.dart';
import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/garage/domain/entities/reminder_entity.dart';
import 'package:deskcar/features/garage/domain/entities/vehicle_entity.dart';
import 'package:deskcar/features/garage/domain/repositories/reminder_repository.dart';
import 'package:deskcar/features/garage/domain/repositories/vehicle_repository.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:deskcar/features/repairs/presentation/widgets/add_service_form_field.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uuid/uuid.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  static const _maxNameLength = 20;
  static const _maxPlateLength = 20;
  static const _maxCommentLength = 1000;

  final _nameController = TextEditingController();
  final _plateController = TextEditingController();
  final _commentController = TextEditingController();
  final _dateIntervalController = TextEditingController(text: '12');
  final _mileageIntervalController = TextEditingController(text: '15000');

  DateTime _purchaseDate = DateTime.now();
  late final _purchaseDateController = TextEditingController(
    text: AppDateFormatter.formatDayMonthYear(_purchaseDate),
  );

  VehicleType _vehicleType = VehicleType.car;
  DistanceUnit _distanceUnit = DistanceUnit.km;
  RepairCategory _intervalCategory = RepairCategory.oil;
  late final _intervalController =
      TextEditingController(text: RepairCategory.oil.label);
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _plateController.dispose();
    _commentController.dispose();
    _purchaseDateController.dispose();
    _dateIntervalController.dispose();
    _mileageIntervalController.dispose();
    _intervalController.dispose();
    super.dispose();
  }

  Future<void> _pickPurchaseDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _purchaseDate,
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _purchaseDate = picked;
        _purchaseDateController.text =
            AppDateFormatter.formatDayMonthYear(picked);
      });
    }
  }

  Future<void> _pickIntervalCategory() async {
    final selected = await showModalBottomSheet<RepairCategory>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.6,
          ),
          decoration: BoxDecoration(
            color: AppColors.backgroundCardLight,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSizes.cardRadius),
            ),
          ),
          child: ListView.separated(
            padding: EdgeInsets.all(AppSizes.cardPadding),
            itemCount: RepairCategory.selectableOptions.length,
            separatorBuilder: (context, index) =>
                SizedBox(height: AppSizes.spacingSm),
            itemBuilder: (context, index) {
              final category = RepairCategory.selectableOptions[index];
              return ListTile(
                leading: Icon(category.icon, color: category.iconColor),
                title: Text(category.label),
                onTap: () => Navigator.of(context).pop(category),
              );
            },
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        _intervalCategory = selected;
        _intervalController.text = selected.label;
      });
    }
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      AppSnackbar.error(context, 'Informe o nome do veículo.');
      return;
    }

    setState(() => _isSaving = true);

    final parsed = VehicleNameParser.parse(name);
    final now = DateTime.now();
    final plate = _plateController.text.trim();
    final notes = _commentController.text.trim();

    final vehicle = VehicleEntity(
      id: const Uuid().v4(),
      brand: parsed.brand,
      model: parsed.model,
      year: parsed.year,
      licensePlate: plate.isEmpty ? null : plate,
      distanceUnit: _distanceUnit,
      vehicleType: _vehicleType,
      purchaseDate: _purchaseDate,
      notes: notes.isEmpty ? null : notes,
      createdAt: now,
      updatedAt: now,
    );

    final result = await getIt<VehicleRepository>().createVehicle(vehicle);

    if (!mounted) {
      return;
    }

    if (result.isError()) {
      setState(() => _isSaving = false);
      result.fold(
        (_) {},
        (failure) => AppSnackbar.error(
          context,
          FailureMessageMapper.message(failure),
        ),
      );
      return;
    }

    final months = int.tryParse(_dateIntervalController.text.trim());
    final mileageInterval =
        AppCurrencyFormatter.parseAmount(_mileageIntervalController.text);

    if (months != null || mileageInterval != null) {
      final reminder = ReminderEntity(
        id: const Uuid().v4(),
        vehicleId: vehicle.id,
        type: _intervalCategory.toReminderType(),
        title: _intervalCategory.label,
        recurrenceMonths: months,
        recurrenceMileage: mileageInterval,
        createdAt: now,
        updatedAt: now,
      );

      await getIt<ReminderRepository>().createReminder(reminder);
    }

    if (!mounted) {
      return;
    }

    setState(() => _isSaving = false);

    AppSnackbar.success(context, 'Veículo adicionado.');
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final nameLength = _nameController.text.characters.length;
    final plateLength = _plateController.text.characters.length;
    final commentLength = _commentController.text.characters.length;

    return Scaffold(
      backgroundColor: AppColors.formScreenBackground,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundCardLight,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          tooltip: 'Fechar',
          onPressed: _isSaving ? null : () => context.pop(),
          icon: const Icon(Icons.close),
        ),
        title: Text(
          'Adicionar veículo',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.bottomNavActiveLight,
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
          PopupMenuButton<String>(
            tooltip: 'Mais opções',
            onSelected: (value) {
              AppSnackbar.info(context, '$value em breve.');
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'Duplicar',
                child: Text('Duplicar'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _FormCard(
              children: [
                _PhotoSection(
                  onPressed: () {
                    AppSnackbar.info(context, 'Foto do veículo em breve.');
                  },
                ),
                SizedBox(height: AppSizes.spacingLg),
                AddServiceFormField(
                  controller: _nameController,
                  label: 'Nome do veículo',
                  maxLength: _maxNameLength,
                  counterText: '$nameLength/$_maxNameLength',
                  onChanged: (_) => setState(() {}),
                ),
                SizedBox(height: AppSizes.spacingMd),
                AddServiceFormField(
                  label: 'Data de compra do veículo',
                  readOnly: true,
                  onTap: _pickPurchaseDate,
                  controller: _purchaseDateController,
                ),
                SizedBox(height: AppSizes.spacingMd),
                AddServiceFormField(
                  controller: _plateController,
                  label: 'Placa do veículo',
                  maxLength: _maxPlateLength,
                  counterText: '$plateLength/$_maxPlateLength',
                  onChanged: (_) => setState(() {}),
                ),
              ],
            ),
            SizedBox(height: AppSizes.spacingMd),
            _FormCard(
              children: [
                _SectionTitle(text: 'Tipo de veículo'),
                SizedBox(height: AppSizes.spacingSm),
                AppSegmentedControl<VehicleType>(
                  selected: _vehicleType,
                  onSelected: (value) => setState(() => _vehicleType = value),
                  segments: const [
                    AppSegmentedControlSegment(
                      value: VehicleType.car,
                      label: 'carro',
                    ),
                    AppSegmentedControlSegment(
                      value: VehicleType.motorcycle,
                      label: 'moto',
                    ),
                    AppSegmentedControlSegment(
                      value: VehicleType.other,
                      label: 'outra',
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.spacingLg),
                _SectionTitle(text: 'Unidades de quilometragem'),
                SizedBox(height: AppSizes.spacingSm),
                AppSegmentedControl<DistanceUnit>(
                  selected: _distanceUnit,
                  onSelected: (value) => setState(() => _distanceUnit = value),
                  segments: const [
                    AppSegmentedControlSegment(
                      value: DistanceUnit.km,
                      label: 'quilômetros',
                      flex: 2,
                    ),
                    AppSegmentedControlSegment(
                      value: DistanceUnit.mi,
                      label: 'milhas',
                    ),
                    AppSegmentedControlSegment(
                      value: DistanceUnit.hours,
                      label: 'horas do motor',
                      flex: 2,
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.spacingLg),
                _SectionTitle(text: 'Intervalos'),
                SizedBox(height: AppSizes.spacingMd),
                AddServiceFormField(
                  label: 'Selecione o intervalo',
                  readOnly: true,
                  onTap: _pickIntervalCategory,
                  controller: _intervalController,
                ),
                SizedBox(height: AppSizes.spacingMd),
                AddServiceFormField(
                  controller: _dateIntervalController,
                  label: 'Intervalo por data',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  suffixText: 'meses',
                ),
                SizedBox(height: AppSizes.spacingMd),
                AddServiceFormField(
                  controller: _mileageIntervalController,
                  label: 'Intervalo por quilometragem',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  suffixText: _distanceUnit.intervalSuffix,
                ),
              ],
            ),
            SizedBox(height: AppSizes.spacingMd),
            _FormCard(
              children: [
                AddServiceFormField(
                  controller: _commentController,
                  hintText: 'Comente',
                  fillColor: AppColors.formInfoFieldFill,
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
        color: AppColors.backgroundCardLight,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.bottomNavActiveLight,
          ),
    );
  }
}

class _PhotoSection extends StatelessWidget {
  const _PhotoSection({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          color: AppColors.formFieldFill,
          borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(AppSizes.cardRadius),
            child: SizedBox(
              width: 22.w,
              height: 22.w,
              child: Icon(
                Icons.add_a_photo_outlined,
                size: AppSizes.iconLg,
                color: AppColors.bottomNavActiveLight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
