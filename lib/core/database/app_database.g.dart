// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $VehiclesTableTable extends VehiclesTable
    with TableInfo<$VehiclesTableTable, VehiclesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehiclesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
    'model',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _licensePlateMeta = const VerificationMeta(
    'licensePlate',
  );
  @override
  late final GeneratedColumn<String> licensePlate = GeneratedColumn<String>(
    'license_plate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverPhotoPathMeta = const VerificationMeta(
    'coverPhotoPath',
  );
  @override
  late final GeneratedColumn<String> coverPhotoPath = GeneratedColumn<String>(
    'cover_photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _distanceUnitMeta = const VerificationMeta(
    'distanceUnit',
  );
  @override
  late final GeneratedColumn<String> distanceUnit = GeneratedColumn<String>(
    'distance_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentOdometerMeta = const VerificationMeta(
    'currentOdometer',
  );
  @override
  late final GeneratedColumn<double> currentOdometer = GeneratedColumn<double>(
    'current_odometer',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    brand,
    model,
    year,
    licensePlate,
    coverPhotoPath,
    distanceUnit,
    currentOdometer,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicles_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehiclesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    } else if (isInserting) {
      context.missing(_brandMeta);
    }
    if (data.containsKey('model')) {
      context.handle(
        _modelMeta,
        model.isAcceptableOrUnknown(data['model']!, _modelMeta),
      );
    } else if (isInserting) {
      context.missing(_modelMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('license_plate')) {
      context.handle(
        _licensePlateMeta,
        licensePlate.isAcceptableOrUnknown(
          data['license_plate']!,
          _licensePlateMeta,
        ),
      );
    }
    if (data.containsKey('cover_photo_path')) {
      context.handle(
        _coverPhotoPathMeta,
        coverPhotoPath.isAcceptableOrUnknown(
          data['cover_photo_path']!,
          _coverPhotoPathMeta,
        ),
      );
    }
    if (data.containsKey('distance_unit')) {
      context.handle(
        _distanceUnitMeta,
        distanceUnit.isAcceptableOrUnknown(
          data['distance_unit']!,
          _distanceUnitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_distanceUnitMeta);
    }
    if (data.containsKey('current_odometer')) {
      context.handle(
        _currentOdometerMeta,
        currentOdometer.isAcceptableOrUnknown(
          data['current_odometer']!,
          _currentOdometerMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehiclesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehiclesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      )!,
      model: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      ),
      licensePlate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}license_plate'],
      ),
      coverPhotoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_photo_path'],
      ),
      distanceUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}distance_unit'],
      )!,
      currentOdometer: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_odometer'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $VehiclesTableTable createAlias(String alias) {
    return $VehiclesTableTable(attachedDatabase, alias);
  }
}

class VehiclesTableData extends DataClass
    implements Insertable<VehiclesTableData> {
  final String id;
  final String brand;
  final String model;
  final int? year;
  final String? licensePlate;
  final String? coverPhotoPath;
  final String distanceUnit;
  final double? currentOdometer;
  final DateTime createdAt;
  final DateTime updatedAt;
  const VehiclesTableData({
    required this.id,
    required this.brand,
    required this.model,
    this.year,
    this.licensePlate,
    this.coverPhotoPath,
    required this.distanceUnit,
    this.currentOdometer,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['brand'] = Variable<String>(brand);
    map['model'] = Variable<String>(model);
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    if (!nullToAbsent || licensePlate != null) {
      map['license_plate'] = Variable<String>(licensePlate);
    }
    if (!nullToAbsent || coverPhotoPath != null) {
      map['cover_photo_path'] = Variable<String>(coverPhotoPath);
    }
    map['distance_unit'] = Variable<String>(distanceUnit);
    if (!nullToAbsent || currentOdometer != null) {
      map['current_odometer'] = Variable<double>(currentOdometer);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  VehiclesTableCompanion toCompanion(bool nullToAbsent) {
    return VehiclesTableCompanion(
      id: Value(id),
      brand: Value(brand),
      model: Value(model),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      licensePlate: licensePlate == null && nullToAbsent
          ? const Value.absent()
          : Value(licensePlate),
      coverPhotoPath: coverPhotoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPhotoPath),
      distanceUnit: Value(distanceUnit),
      currentOdometer: currentOdometer == null && nullToAbsent
          ? const Value.absent()
          : Value(currentOdometer),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory VehiclesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehiclesTableData(
      id: serializer.fromJson<String>(json['id']),
      brand: serializer.fromJson<String>(json['brand']),
      model: serializer.fromJson<String>(json['model']),
      year: serializer.fromJson<int?>(json['year']),
      licensePlate: serializer.fromJson<String?>(json['licensePlate']),
      coverPhotoPath: serializer.fromJson<String?>(json['coverPhotoPath']),
      distanceUnit: serializer.fromJson<String>(json['distanceUnit']),
      currentOdometer: serializer.fromJson<double?>(json['currentOdometer']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'brand': serializer.toJson<String>(brand),
      'model': serializer.toJson<String>(model),
      'year': serializer.toJson<int?>(year),
      'licensePlate': serializer.toJson<String?>(licensePlate),
      'coverPhotoPath': serializer.toJson<String?>(coverPhotoPath),
      'distanceUnit': serializer.toJson<String>(distanceUnit),
      'currentOdometer': serializer.toJson<double?>(currentOdometer),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  VehiclesTableData copyWith({
    String? id,
    String? brand,
    String? model,
    Value<int?> year = const Value.absent(),
    Value<String?> licensePlate = const Value.absent(),
    Value<String?> coverPhotoPath = const Value.absent(),
    String? distanceUnit,
    Value<double?> currentOdometer = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => VehiclesTableData(
    id: id ?? this.id,
    brand: brand ?? this.brand,
    model: model ?? this.model,
    year: year.present ? year.value : this.year,
    licensePlate: licensePlate.present ? licensePlate.value : this.licensePlate,
    coverPhotoPath: coverPhotoPath.present
        ? coverPhotoPath.value
        : this.coverPhotoPath,
    distanceUnit: distanceUnit ?? this.distanceUnit,
    currentOdometer: currentOdometer.present
        ? currentOdometer.value
        : this.currentOdometer,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  VehiclesTableData copyWithCompanion(VehiclesTableCompanion data) {
    return VehiclesTableData(
      id: data.id.present ? data.id.value : this.id,
      brand: data.brand.present ? data.brand.value : this.brand,
      model: data.model.present ? data.model.value : this.model,
      year: data.year.present ? data.year.value : this.year,
      licensePlate: data.licensePlate.present
          ? data.licensePlate.value
          : this.licensePlate,
      coverPhotoPath: data.coverPhotoPath.present
          ? data.coverPhotoPath.value
          : this.coverPhotoPath,
      distanceUnit: data.distanceUnit.present
          ? data.distanceUnit.value
          : this.distanceUnit,
      currentOdometer: data.currentOdometer.present
          ? data.currentOdometer.value
          : this.currentOdometer,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehiclesTableData(')
          ..write('id: $id, ')
          ..write('brand: $brand, ')
          ..write('model: $model, ')
          ..write('year: $year, ')
          ..write('licensePlate: $licensePlate, ')
          ..write('coverPhotoPath: $coverPhotoPath, ')
          ..write('distanceUnit: $distanceUnit, ')
          ..write('currentOdometer: $currentOdometer, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    brand,
    model,
    year,
    licensePlate,
    coverPhotoPath,
    distanceUnit,
    currentOdometer,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehiclesTableData &&
          other.id == this.id &&
          other.brand == this.brand &&
          other.model == this.model &&
          other.year == this.year &&
          other.licensePlate == this.licensePlate &&
          other.coverPhotoPath == this.coverPhotoPath &&
          other.distanceUnit == this.distanceUnit &&
          other.currentOdometer == this.currentOdometer &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VehiclesTableCompanion extends UpdateCompanion<VehiclesTableData> {
  final Value<String> id;
  final Value<String> brand;
  final Value<String> model;
  final Value<int?> year;
  final Value<String?> licensePlate;
  final Value<String?> coverPhotoPath;
  final Value<String> distanceUnit;
  final Value<double?> currentOdometer;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const VehiclesTableCompanion({
    this.id = const Value.absent(),
    this.brand = const Value.absent(),
    this.model = const Value.absent(),
    this.year = const Value.absent(),
    this.licensePlate = const Value.absent(),
    this.coverPhotoPath = const Value.absent(),
    this.distanceUnit = const Value.absent(),
    this.currentOdometer = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VehiclesTableCompanion.insert({
    required String id,
    required String brand,
    required String model,
    this.year = const Value.absent(),
    this.licensePlate = const Value.absent(),
    this.coverPhotoPath = const Value.absent(),
    required String distanceUnit,
    this.currentOdometer = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       brand = Value(brand),
       model = Value(model),
       distanceUnit = Value(distanceUnit),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<VehiclesTableData> custom({
    Expression<String>? id,
    Expression<String>? brand,
    Expression<String>? model,
    Expression<int>? year,
    Expression<String>? licensePlate,
    Expression<String>? coverPhotoPath,
    Expression<String>? distanceUnit,
    Expression<double>? currentOdometer,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (brand != null) 'brand': brand,
      if (model != null) 'model': model,
      if (year != null) 'year': year,
      if (licensePlate != null) 'license_plate': licensePlate,
      if (coverPhotoPath != null) 'cover_photo_path': coverPhotoPath,
      if (distanceUnit != null) 'distance_unit': distanceUnit,
      if (currentOdometer != null) 'current_odometer': currentOdometer,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VehiclesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? brand,
    Value<String>? model,
    Value<int?>? year,
    Value<String?>? licensePlate,
    Value<String?>? coverPhotoPath,
    Value<String>? distanceUnit,
    Value<double?>? currentOdometer,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return VehiclesTableCompanion(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      year: year ?? this.year,
      licensePlate: licensePlate ?? this.licensePlate,
      coverPhotoPath: coverPhotoPath ?? this.coverPhotoPath,
      distanceUnit: distanceUnit ?? this.distanceUnit,
      currentOdometer: currentOdometer ?? this.currentOdometer,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (licensePlate.present) {
      map['license_plate'] = Variable<String>(licensePlate.value);
    }
    if (coverPhotoPath.present) {
      map['cover_photo_path'] = Variable<String>(coverPhotoPath.value);
    }
    if (distanceUnit.present) {
      map['distance_unit'] = Variable<String>(distanceUnit.value);
    }
    if (currentOdometer.present) {
      map['current_odometer'] = Variable<double>(currentOdometer.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehiclesTableCompanion(')
          ..write('id: $id, ')
          ..write('brand: $brand, ')
          ..write('model: $model, ')
          ..write('year: $year, ')
          ..write('licensePlate: $licensePlate, ')
          ..write('coverPhotoPath: $coverPhotoPath, ')
          ..write('distanceUnit: $distanceUnit, ')
          ..write('currentOdometer: $currentOdometer, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ServiceRecordsTableTable extends ServiceRecordsTable
    with TableInfo<$ServiceRecordsTableTable, ServiceRecordsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceRecordsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<String> vehicleId = GeneratedColumn<String>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicles_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _providerNameMeta = const VerificationMeta(
    'providerName',
  );
  @override
  late final GeneratedColumn<String> providerName = GeneratedColumn<String>(
    'provider_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serviceDateMeta = const VerificationMeta(
    'serviceDate',
  );
  @override
  late final GeneratedColumn<DateTime> serviceDate = GeneratedColumn<DateTime>(
    'service_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mileageMeta = const VerificationMeta(
    'mileage',
  );
  @override
  late final GeneratedColumn<double> mileage = GeneratedColumn<double>(
    'mileage',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _partsAmountMeta = const VerificationMeta(
    'partsAmount',
  );
  @override
  late final GeneratedColumn<double> partsAmount = GeneratedColumn<double>(
    'parts_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _laborAmountMeta = const VerificationMeta(
    'laborAmount',
  );
  @override
  late final GeneratedColumn<double> laborAmount = GeneratedColumn<double>(
    'labor_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vehicleId,
    type,
    title,
    providerName,
    notes,
    serviceDate,
    dueDate,
    mileage,
    totalAmount,
    partsAmount,
    laborAmount,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_records_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ServiceRecordsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('provider_name')) {
      context.handle(
        _providerNameMeta,
        providerName.isAcceptableOrUnknown(
          data['provider_name']!,
          _providerNameMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('service_date')) {
      context.handle(
        _serviceDateMeta,
        serviceDate.isAcceptableOrUnknown(
          data['service_date']!,
          _serviceDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_serviceDateMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('mileage')) {
      context.handle(
        _mileageMeta,
        mileage.isAcceptableOrUnknown(data['mileage']!, _mileageMeta),
      );
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('parts_amount')) {
      context.handle(
        _partsAmountMeta,
        partsAmount.isAcceptableOrUnknown(
          data['parts_amount']!,
          _partsAmountMeta,
        ),
      );
    }
    if (data.containsKey('labor_amount')) {
      context.handle(
        _laborAmountMeta,
        laborAmount.isAcceptableOrUnknown(
          data['labor_amount']!,
          _laborAmountMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceRecordsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceRecordsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vehicle_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      providerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_name'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      serviceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}service_date'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      mileage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mileage'],
      ),
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_amount'],
      )!,
      partsAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}parts_amount'],
      )!,
      laborAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}labor_amount'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ServiceRecordsTableTable createAlias(String alias) {
    return $ServiceRecordsTableTable(attachedDatabase, alias);
  }
}

class ServiceRecordsTableData extends DataClass
    implements Insertable<ServiceRecordsTableData> {
  final String id;
  final String vehicleId;
  final String type;
  final String title;
  final String? providerName;
  final String? notes;
  final DateTime serviceDate;
  final DateTime? dueDate;
  final double? mileage;
  final double totalAmount;
  final double partsAmount;
  final double laborAmount;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ServiceRecordsTableData({
    required this.id,
    required this.vehicleId,
    required this.type,
    required this.title,
    this.providerName,
    this.notes,
    required this.serviceDate,
    this.dueDate,
    this.mileage,
    required this.totalAmount,
    required this.partsAmount,
    required this.laborAmount,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['vehicle_id'] = Variable<String>(vehicleId);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || providerName != null) {
      map['provider_name'] = Variable<String>(providerName);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['service_date'] = Variable<DateTime>(serviceDate);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || mileage != null) {
      map['mileage'] = Variable<double>(mileage);
    }
    map['total_amount'] = Variable<double>(totalAmount);
    map['parts_amount'] = Variable<double>(partsAmount);
    map['labor_amount'] = Variable<double>(laborAmount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ServiceRecordsTableCompanion toCompanion(bool nullToAbsent) {
    return ServiceRecordsTableCompanion(
      id: Value(id),
      vehicleId: Value(vehicleId),
      type: Value(type),
      title: Value(title),
      providerName: providerName == null && nullToAbsent
          ? const Value.absent()
          : Value(providerName),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      serviceDate: Value(serviceDate),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      mileage: mileage == null && nullToAbsent
          ? const Value.absent()
          : Value(mileage),
      totalAmount: Value(totalAmount),
      partsAmount: Value(partsAmount),
      laborAmount: Value(laborAmount),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ServiceRecordsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceRecordsTableData(
      id: serializer.fromJson<String>(json['id']),
      vehicleId: serializer.fromJson<String>(json['vehicleId']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      providerName: serializer.fromJson<String?>(json['providerName']),
      notes: serializer.fromJson<String?>(json['notes']),
      serviceDate: serializer.fromJson<DateTime>(json['serviceDate']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      mileage: serializer.fromJson<double?>(json['mileage']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      partsAmount: serializer.fromJson<double>(json['partsAmount']),
      laborAmount: serializer.fromJson<double>(json['laborAmount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'vehicleId': serializer.toJson<String>(vehicleId),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'providerName': serializer.toJson<String?>(providerName),
      'notes': serializer.toJson<String?>(notes),
      'serviceDate': serializer.toJson<DateTime>(serviceDate),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'mileage': serializer.toJson<double?>(mileage),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'partsAmount': serializer.toJson<double>(partsAmount),
      'laborAmount': serializer.toJson<double>(laborAmount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ServiceRecordsTableData copyWith({
    String? id,
    String? vehicleId,
    String? type,
    String? title,
    Value<String?> providerName = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? serviceDate,
    Value<DateTime?> dueDate = const Value.absent(),
    Value<double?> mileage = const Value.absent(),
    double? totalAmount,
    double? partsAmount,
    double? laborAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ServiceRecordsTableData(
    id: id ?? this.id,
    vehicleId: vehicleId ?? this.vehicleId,
    type: type ?? this.type,
    title: title ?? this.title,
    providerName: providerName.present ? providerName.value : this.providerName,
    notes: notes.present ? notes.value : this.notes,
    serviceDate: serviceDate ?? this.serviceDate,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    mileage: mileage.present ? mileage.value : this.mileage,
    totalAmount: totalAmount ?? this.totalAmount,
    partsAmount: partsAmount ?? this.partsAmount,
    laborAmount: laborAmount ?? this.laborAmount,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ServiceRecordsTableData copyWithCompanion(ServiceRecordsTableCompanion data) {
    return ServiceRecordsTableData(
      id: data.id.present ? data.id.value : this.id,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      providerName: data.providerName.present
          ? data.providerName.value
          : this.providerName,
      notes: data.notes.present ? data.notes.value : this.notes,
      serviceDate: data.serviceDate.present
          ? data.serviceDate.value
          : this.serviceDate,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      mileage: data.mileage.present ? data.mileage.value : this.mileage,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      partsAmount: data.partsAmount.present
          ? data.partsAmount.value
          : this.partsAmount,
      laborAmount: data.laborAmount.present
          ? data.laborAmount.value
          : this.laborAmount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceRecordsTableData(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('providerName: $providerName, ')
          ..write('notes: $notes, ')
          ..write('serviceDate: $serviceDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('mileage: $mileage, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('partsAmount: $partsAmount, ')
          ..write('laborAmount: $laborAmount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    vehicleId,
    type,
    title,
    providerName,
    notes,
    serviceDate,
    dueDate,
    mileage,
    totalAmount,
    partsAmount,
    laborAmount,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceRecordsTableData &&
          other.id == this.id &&
          other.vehicleId == this.vehicleId &&
          other.type == this.type &&
          other.title == this.title &&
          other.providerName == this.providerName &&
          other.notes == this.notes &&
          other.serviceDate == this.serviceDate &&
          other.dueDate == this.dueDate &&
          other.mileage == this.mileage &&
          other.totalAmount == this.totalAmount &&
          other.partsAmount == this.partsAmount &&
          other.laborAmount == this.laborAmount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ServiceRecordsTableCompanion
    extends UpdateCompanion<ServiceRecordsTableData> {
  final Value<String> id;
  final Value<String> vehicleId;
  final Value<String> type;
  final Value<String> title;
  final Value<String?> providerName;
  final Value<String?> notes;
  final Value<DateTime> serviceDate;
  final Value<DateTime?> dueDate;
  final Value<double?> mileage;
  final Value<double> totalAmount;
  final Value<double> partsAmount;
  final Value<double> laborAmount;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ServiceRecordsTableCompanion({
    this.id = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.providerName = const Value.absent(),
    this.notes = const Value.absent(),
    this.serviceDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.mileage = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.partsAmount = const Value.absent(),
    this.laborAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ServiceRecordsTableCompanion.insert({
    required String id,
    required String vehicleId,
    required String type,
    required String title,
    this.providerName = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime serviceDate,
    this.dueDate = const Value.absent(),
    this.mileage = const Value.absent(),
    required double totalAmount,
    this.partsAmount = const Value.absent(),
    this.laborAmount = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       vehicleId = Value(vehicleId),
       type = Value(type),
       title = Value(title),
       serviceDate = Value(serviceDate),
       totalAmount = Value(totalAmount),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ServiceRecordsTableData> custom({
    Expression<String>? id,
    Expression<String>? vehicleId,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? providerName,
    Expression<String>? notes,
    Expression<DateTime>? serviceDate,
    Expression<DateTime>? dueDate,
    Expression<double>? mileage,
    Expression<double>? totalAmount,
    Expression<double>? partsAmount,
    Expression<double>? laborAmount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (providerName != null) 'provider_name': providerName,
      if (notes != null) 'notes': notes,
      if (serviceDate != null) 'service_date': serviceDate,
      if (dueDate != null) 'due_date': dueDate,
      if (mileage != null) 'mileage': mileage,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (partsAmount != null) 'parts_amount': partsAmount,
      if (laborAmount != null) 'labor_amount': laborAmount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ServiceRecordsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? vehicleId,
    Value<String>? type,
    Value<String>? title,
    Value<String?>? providerName,
    Value<String?>? notes,
    Value<DateTime>? serviceDate,
    Value<DateTime?>? dueDate,
    Value<double?>? mileage,
    Value<double>? totalAmount,
    Value<double>? partsAmount,
    Value<double>? laborAmount,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ServiceRecordsTableCompanion(
      id: id ?? this.id,
      vehicleId: vehicleId ?? this.vehicleId,
      type: type ?? this.type,
      title: title ?? this.title,
      providerName: providerName ?? this.providerName,
      notes: notes ?? this.notes,
      serviceDate: serviceDate ?? this.serviceDate,
      dueDate: dueDate ?? this.dueDate,
      mileage: mileage ?? this.mileage,
      totalAmount: totalAmount ?? this.totalAmount,
      partsAmount: partsAmount ?? this.partsAmount,
      laborAmount: laborAmount ?? this.laborAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<String>(vehicleId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (providerName.present) {
      map['provider_name'] = Variable<String>(providerName.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (serviceDate.present) {
      map['service_date'] = Variable<DateTime>(serviceDate.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (mileage.present) {
      map['mileage'] = Variable<double>(mileage.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (partsAmount.present) {
      map['parts_amount'] = Variable<double>(partsAmount.value);
    }
    if (laborAmount.present) {
      map['labor_amount'] = Variable<double>(laborAmount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceRecordsTableCompanion(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('providerName: $providerName, ')
          ..write('notes: $notes, ')
          ..write('serviceDate: $serviceDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('mileage: $mileage, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('partsAmount: $partsAmount, ')
          ..write('laborAmount: $laborAmount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ServiceAttachmentsTableTable extends ServiceAttachmentsTable
    with TableInfo<$ServiceAttachmentsTableTable, ServiceAttachmentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceAttachmentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serviceRecordIdMeta = const VerificationMeta(
    'serviceRecordId',
  );
  @override
  late final GeneratedColumn<String> serviceRecordId = GeneratedColumn<String>(
    'service_record_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES service_records_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    serviceRecordId,
    filePath,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_attachments_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ServiceAttachmentsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('service_record_id')) {
      context.handle(
        _serviceRecordIdMeta,
        serviceRecordId.isAcceptableOrUnknown(
          data['service_record_id']!,
          _serviceRecordIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_serviceRecordIdMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceAttachmentsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceAttachmentsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      serviceRecordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}service_record_id'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ServiceAttachmentsTableTable createAlias(String alias) {
    return $ServiceAttachmentsTableTable(attachedDatabase, alias);
  }
}

class ServiceAttachmentsTableData extends DataClass
    implements Insertable<ServiceAttachmentsTableData> {
  final String id;
  final String serviceRecordId;
  final String filePath;
  final DateTime createdAt;
  const ServiceAttachmentsTableData({
    required this.id,
    required this.serviceRecordId,
    required this.filePath,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['service_record_id'] = Variable<String>(serviceRecordId);
    map['file_path'] = Variable<String>(filePath);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ServiceAttachmentsTableCompanion toCompanion(bool nullToAbsent) {
    return ServiceAttachmentsTableCompanion(
      id: Value(id),
      serviceRecordId: Value(serviceRecordId),
      filePath: Value(filePath),
      createdAt: Value(createdAt),
    );
  }

  factory ServiceAttachmentsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceAttachmentsTableData(
      id: serializer.fromJson<String>(json['id']),
      serviceRecordId: serializer.fromJson<String>(json['serviceRecordId']),
      filePath: serializer.fromJson<String>(json['filePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'serviceRecordId': serializer.toJson<String>(serviceRecordId),
      'filePath': serializer.toJson<String>(filePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ServiceAttachmentsTableData copyWith({
    String? id,
    String? serviceRecordId,
    String? filePath,
    DateTime? createdAt,
  }) => ServiceAttachmentsTableData(
    id: id ?? this.id,
    serviceRecordId: serviceRecordId ?? this.serviceRecordId,
    filePath: filePath ?? this.filePath,
    createdAt: createdAt ?? this.createdAt,
  );
  ServiceAttachmentsTableData copyWithCompanion(
    ServiceAttachmentsTableCompanion data,
  ) {
    return ServiceAttachmentsTableData(
      id: data.id.present ? data.id.value : this.id,
      serviceRecordId: data.serviceRecordId.present
          ? data.serviceRecordId.value
          : this.serviceRecordId,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceAttachmentsTableData(')
          ..write('id: $id, ')
          ..write('serviceRecordId: $serviceRecordId, ')
          ..write('filePath: $filePath, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, serviceRecordId, filePath, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceAttachmentsTableData &&
          other.id == this.id &&
          other.serviceRecordId == this.serviceRecordId &&
          other.filePath == this.filePath &&
          other.createdAt == this.createdAt);
}

class ServiceAttachmentsTableCompanion
    extends UpdateCompanion<ServiceAttachmentsTableData> {
  final Value<String> id;
  final Value<String> serviceRecordId;
  final Value<String> filePath;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ServiceAttachmentsTableCompanion({
    this.id = const Value.absent(),
    this.serviceRecordId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ServiceAttachmentsTableCompanion.insert({
    required String id,
    required String serviceRecordId,
    required String filePath,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       serviceRecordId = Value(serviceRecordId),
       filePath = Value(filePath),
       createdAt = Value(createdAt);
  static Insertable<ServiceAttachmentsTableData> custom({
    Expression<String>? id,
    Expression<String>? serviceRecordId,
    Expression<String>? filePath,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serviceRecordId != null) 'service_record_id': serviceRecordId,
      if (filePath != null) 'file_path': filePath,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ServiceAttachmentsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? serviceRecordId,
    Value<String>? filePath,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ServiceAttachmentsTableCompanion(
      id: id ?? this.id,
      serviceRecordId: serviceRecordId ?? this.serviceRecordId,
      filePath: filePath ?? this.filePath,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (serviceRecordId.present) {
      map['service_record_id'] = Variable<String>(serviceRecordId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceAttachmentsTableCompanion(')
          ..write('id: $id, ')
          ..write('serviceRecordId: $serviceRecordId, ')
          ..write('filePath: $filePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RemindersTableTable extends RemindersTable
    with TableInfo<$RemindersTableTable, RemindersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<String> vehicleId = GeneratedColumn<String>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicles_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetDateMeta = const VerificationMeta(
    'targetDate',
  );
  @override
  late final GeneratedColumn<DateTime> targetDate = GeneratedColumn<DateTime>(
    'target_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetMileageMeta = const VerificationMeta(
    'targetMileage',
  );
  @override
  late final GeneratedColumn<double> targetMileage = GeneratedColumn<double>(
    'target_mileage',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recurrenceMonthsMeta = const VerificationMeta(
    'recurrenceMonths',
  );
  @override
  late final GeneratedColumn<int> recurrenceMonths = GeneratedColumn<int>(
    'recurrence_months',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recurrenceMileageMeta = const VerificationMeta(
    'recurrenceMileage',
  );
  @override
  late final GeneratedColumn<double> recurrenceMileage =
      GeneratedColumn<double>(
        'recurrence_mileage',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _lastCompletedAtMeta = const VerificationMeta(
    'lastCompletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastCompletedAt =
      GeneratedColumn<DateTime>(
        'last_completed_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _lastCompletedMileageMeta =
      const VerificationMeta('lastCompletedMileage');
  @override
  late final GeneratedColumn<double> lastCompletedMileage =
      GeneratedColumn<double>(
        'last_completed_mileage',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vehicleId,
    type,
    title,
    targetDate,
    targetMileage,
    recurrenceMonths,
    recurrenceMileage,
    lastCompletedAt,
    lastCompletedMileage,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RemindersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('target_date')) {
      context.handle(
        _targetDateMeta,
        targetDate.isAcceptableOrUnknown(data['target_date']!, _targetDateMeta),
      );
    }
    if (data.containsKey('target_mileage')) {
      context.handle(
        _targetMileageMeta,
        targetMileage.isAcceptableOrUnknown(
          data['target_mileage']!,
          _targetMileageMeta,
        ),
      );
    }
    if (data.containsKey('recurrence_months')) {
      context.handle(
        _recurrenceMonthsMeta,
        recurrenceMonths.isAcceptableOrUnknown(
          data['recurrence_months']!,
          _recurrenceMonthsMeta,
        ),
      );
    }
    if (data.containsKey('recurrence_mileage')) {
      context.handle(
        _recurrenceMileageMeta,
        recurrenceMileage.isAcceptableOrUnknown(
          data['recurrence_mileage']!,
          _recurrenceMileageMeta,
        ),
      );
    }
    if (data.containsKey('last_completed_at')) {
      context.handle(
        _lastCompletedAtMeta,
        lastCompletedAt.isAcceptableOrUnknown(
          data['last_completed_at']!,
          _lastCompletedAtMeta,
        ),
      );
    }
    if (data.containsKey('last_completed_mileage')) {
      context.handle(
        _lastCompletedMileageMeta,
        lastCompletedMileage.isAcceptableOrUnknown(
          data['last_completed_mileage']!,
          _lastCompletedMileageMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RemindersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RemindersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vehicle_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      targetDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}target_date'],
      ),
      targetMileage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_mileage'],
      ),
      recurrenceMonths: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}recurrence_months'],
      ),
      recurrenceMileage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}recurrence_mileage'],
      ),
      lastCompletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_completed_at'],
      ),
      lastCompletedMileage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}last_completed_mileage'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $RemindersTableTable createAlias(String alias) {
    return $RemindersTableTable(attachedDatabase, alias);
  }
}

class RemindersTableData extends DataClass
    implements Insertable<RemindersTableData> {
  final String id;
  final String vehicleId;
  final String type;
  final String? title;
  final DateTime? targetDate;
  final double? targetMileage;
  final int? recurrenceMonths;
  final double? recurrenceMileage;
  final DateTime? lastCompletedAt;
  final double? lastCompletedMileage;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const RemindersTableData({
    required this.id,
    required this.vehicleId,
    required this.type,
    this.title,
    this.targetDate,
    this.targetMileage,
    this.recurrenceMonths,
    this.recurrenceMileage,
    this.lastCompletedAt,
    this.lastCompletedMileage,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['vehicle_id'] = Variable<String>(vehicleId);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || targetDate != null) {
      map['target_date'] = Variable<DateTime>(targetDate);
    }
    if (!nullToAbsent || targetMileage != null) {
      map['target_mileage'] = Variable<double>(targetMileage);
    }
    if (!nullToAbsent || recurrenceMonths != null) {
      map['recurrence_months'] = Variable<int>(recurrenceMonths);
    }
    if (!nullToAbsent || recurrenceMileage != null) {
      map['recurrence_mileage'] = Variable<double>(recurrenceMileage);
    }
    if (!nullToAbsent || lastCompletedAt != null) {
      map['last_completed_at'] = Variable<DateTime>(lastCompletedAt);
    }
    if (!nullToAbsent || lastCompletedMileage != null) {
      map['last_completed_mileage'] = Variable<double>(lastCompletedMileage);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RemindersTableCompanion toCompanion(bool nullToAbsent) {
    return RemindersTableCompanion(
      id: Value(id),
      vehicleId: Value(vehicleId),
      type: Value(type),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      targetDate: targetDate == null && nullToAbsent
          ? const Value.absent()
          : Value(targetDate),
      targetMileage: targetMileage == null && nullToAbsent
          ? const Value.absent()
          : Value(targetMileage),
      recurrenceMonths: recurrenceMonths == null && nullToAbsent
          ? const Value.absent()
          : Value(recurrenceMonths),
      recurrenceMileage: recurrenceMileage == null && nullToAbsent
          ? const Value.absent()
          : Value(recurrenceMileage),
      lastCompletedAt: lastCompletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCompletedAt),
      lastCompletedMileage: lastCompletedMileage == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCompletedMileage),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory RemindersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RemindersTableData(
      id: serializer.fromJson<String>(json['id']),
      vehicleId: serializer.fromJson<String>(json['vehicleId']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String?>(json['title']),
      targetDate: serializer.fromJson<DateTime?>(json['targetDate']),
      targetMileage: serializer.fromJson<double?>(json['targetMileage']),
      recurrenceMonths: serializer.fromJson<int?>(json['recurrenceMonths']),
      recurrenceMileage: serializer.fromJson<double?>(
        json['recurrenceMileage'],
      ),
      lastCompletedAt: serializer.fromJson<DateTime?>(json['lastCompletedAt']),
      lastCompletedMileage: serializer.fromJson<double?>(
        json['lastCompletedMileage'],
      ),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'vehicleId': serializer.toJson<String>(vehicleId),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String?>(title),
      'targetDate': serializer.toJson<DateTime?>(targetDate),
      'targetMileage': serializer.toJson<double?>(targetMileage),
      'recurrenceMonths': serializer.toJson<int?>(recurrenceMonths),
      'recurrenceMileage': serializer.toJson<double?>(recurrenceMileage),
      'lastCompletedAt': serializer.toJson<DateTime?>(lastCompletedAt),
      'lastCompletedMileage': serializer.toJson<double?>(lastCompletedMileage),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  RemindersTableData copyWith({
    String? id,
    String? vehicleId,
    String? type,
    Value<String?> title = const Value.absent(),
    Value<DateTime?> targetDate = const Value.absent(),
    Value<double?> targetMileage = const Value.absent(),
    Value<int?> recurrenceMonths = const Value.absent(),
    Value<double?> recurrenceMileage = const Value.absent(),
    Value<DateTime?> lastCompletedAt = const Value.absent(),
    Value<double?> lastCompletedMileage = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => RemindersTableData(
    id: id ?? this.id,
    vehicleId: vehicleId ?? this.vehicleId,
    type: type ?? this.type,
    title: title.present ? title.value : this.title,
    targetDate: targetDate.present ? targetDate.value : this.targetDate,
    targetMileage: targetMileage.present
        ? targetMileage.value
        : this.targetMileage,
    recurrenceMonths: recurrenceMonths.present
        ? recurrenceMonths.value
        : this.recurrenceMonths,
    recurrenceMileage: recurrenceMileage.present
        ? recurrenceMileage.value
        : this.recurrenceMileage,
    lastCompletedAt: lastCompletedAt.present
        ? lastCompletedAt.value
        : this.lastCompletedAt,
    lastCompletedMileage: lastCompletedMileage.present
        ? lastCompletedMileage.value
        : this.lastCompletedMileage,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  RemindersTableData copyWithCompanion(RemindersTableCompanion data) {
    return RemindersTableData(
      id: data.id.present ? data.id.value : this.id,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      targetDate: data.targetDate.present
          ? data.targetDate.value
          : this.targetDate,
      targetMileage: data.targetMileage.present
          ? data.targetMileage.value
          : this.targetMileage,
      recurrenceMonths: data.recurrenceMonths.present
          ? data.recurrenceMonths.value
          : this.recurrenceMonths,
      recurrenceMileage: data.recurrenceMileage.present
          ? data.recurrenceMileage.value
          : this.recurrenceMileage,
      lastCompletedAt: data.lastCompletedAt.present
          ? data.lastCompletedAt.value
          : this.lastCompletedAt,
      lastCompletedMileage: data.lastCompletedMileage.present
          ? data.lastCompletedMileage.value
          : this.lastCompletedMileage,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RemindersTableData(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('targetDate: $targetDate, ')
          ..write('targetMileage: $targetMileage, ')
          ..write('recurrenceMonths: $recurrenceMonths, ')
          ..write('recurrenceMileage: $recurrenceMileage, ')
          ..write('lastCompletedAt: $lastCompletedAt, ')
          ..write('lastCompletedMileage: $lastCompletedMileage, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    vehicleId,
    type,
    title,
    targetDate,
    targetMileage,
    recurrenceMonths,
    recurrenceMileage,
    lastCompletedAt,
    lastCompletedMileage,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RemindersTableData &&
          other.id == this.id &&
          other.vehicleId == this.vehicleId &&
          other.type == this.type &&
          other.title == this.title &&
          other.targetDate == this.targetDate &&
          other.targetMileage == this.targetMileage &&
          other.recurrenceMonths == this.recurrenceMonths &&
          other.recurrenceMileage == this.recurrenceMileage &&
          other.lastCompletedAt == this.lastCompletedAt &&
          other.lastCompletedMileage == this.lastCompletedMileage &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RemindersTableCompanion extends UpdateCompanion<RemindersTableData> {
  final Value<String> id;
  final Value<String> vehicleId;
  final Value<String> type;
  final Value<String?> title;
  final Value<DateTime?> targetDate;
  final Value<double?> targetMileage;
  final Value<int?> recurrenceMonths;
  final Value<double?> recurrenceMileage;
  final Value<DateTime?> lastCompletedAt;
  final Value<double?> lastCompletedMileage;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const RemindersTableCompanion({
    this.id = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.targetMileage = const Value.absent(),
    this.recurrenceMonths = const Value.absent(),
    this.recurrenceMileage = const Value.absent(),
    this.lastCompletedAt = const Value.absent(),
    this.lastCompletedMileage = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemindersTableCompanion.insert({
    required String id,
    required String vehicleId,
    required String type,
    this.title = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.targetMileage = const Value.absent(),
    this.recurrenceMonths = const Value.absent(),
    this.recurrenceMileage = const Value.absent(),
    this.lastCompletedAt = const Value.absent(),
    this.lastCompletedMileage = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       vehicleId = Value(vehicleId),
       type = Value(type),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<RemindersTableData> custom({
    Expression<String>? id,
    Expression<String>? vehicleId,
    Expression<String>? type,
    Expression<String>? title,
    Expression<DateTime>? targetDate,
    Expression<double>? targetMileage,
    Expression<int>? recurrenceMonths,
    Expression<double>? recurrenceMileage,
    Expression<DateTime>? lastCompletedAt,
    Expression<double>? lastCompletedMileage,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (targetDate != null) 'target_date': targetDate,
      if (targetMileage != null) 'target_mileage': targetMileage,
      if (recurrenceMonths != null) 'recurrence_months': recurrenceMonths,
      if (recurrenceMileage != null) 'recurrence_mileage': recurrenceMileage,
      if (lastCompletedAt != null) 'last_completed_at': lastCompletedAt,
      if (lastCompletedMileage != null)
        'last_completed_mileage': lastCompletedMileage,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemindersTableCompanion copyWith({
    Value<String>? id,
    Value<String>? vehicleId,
    Value<String>? type,
    Value<String?>? title,
    Value<DateTime?>? targetDate,
    Value<double?>? targetMileage,
    Value<int?>? recurrenceMonths,
    Value<double?>? recurrenceMileage,
    Value<DateTime?>? lastCompletedAt,
    Value<double?>? lastCompletedMileage,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return RemindersTableCompanion(
      id: id ?? this.id,
      vehicleId: vehicleId ?? this.vehicleId,
      type: type ?? this.type,
      title: title ?? this.title,
      targetDate: targetDate ?? this.targetDate,
      targetMileage: targetMileage ?? this.targetMileage,
      recurrenceMonths: recurrenceMonths ?? this.recurrenceMonths,
      recurrenceMileage: recurrenceMileage ?? this.recurrenceMileage,
      lastCompletedAt: lastCompletedAt ?? this.lastCompletedAt,
      lastCompletedMileage: lastCompletedMileage ?? this.lastCompletedMileage,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<String>(vehicleId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (targetDate.present) {
      map['target_date'] = Variable<DateTime>(targetDate.value);
    }
    if (targetMileage.present) {
      map['target_mileage'] = Variable<double>(targetMileage.value);
    }
    if (recurrenceMonths.present) {
      map['recurrence_months'] = Variable<int>(recurrenceMonths.value);
    }
    if (recurrenceMileage.present) {
      map['recurrence_mileage'] = Variable<double>(recurrenceMileage.value);
    }
    if (lastCompletedAt.present) {
      map['last_completed_at'] = Variable<DateTime>(lastCompletedAt.value);
    }
    if (lastCompletedMileage.present) {
      map['last_completed_mileage'] = Variable<double>(
        lastCompletedMileage.value,
      );
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersTableCompanion(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('targetDate: $targetDate, ')
          ..write('targetMileage: $targetMileage, ')
          ..write('recurrenceMonths: $recurrenceMonths, ')
          ..write('recurrenceMileage: $recurrenceMileage, ')
          ..write('lastCompletedAt: $lastCompletedAt, ')
          ..write('lastCompletedMileage: $lastCompletedMileage, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OdometerReadingsTableTable extends OdometerReadingsTable
    with TableInfo<$OdometerReadingsTableTable, OdometerReadingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OdometerReadingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<String> vehicleId = GeneratedColumn<String>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicles_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mileageMeta = const VerificationMeta(
    'mileage',
  );
  @override
  late final GeneratedColumn<double> mileage = GeneratedColumn<double>(
    'mileage',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vehicleId,
    recordedAt,
    mileage,
    source,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'odometer_readings_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<OdometerReadingsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('mileage')) {
      context.handle(
        _mileageMeta,
        mileage.isAcceptableOrUnknown(data['mileage']!, _mileageMeta),
      );
    } else if (isInserting) {
      context.missing(_mileageMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OdometerReadingsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OdometerReadingsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vehicle_id'],
      )!,
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      mileage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mileage'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $OdometerReadingsTableTable createAlias(String alias) {
    return $OdometerReadingsTableTable(attachedDatabase, alias);
  }
}

class OdometerReadingsTableData extends DataClass
    implements Insertable<OdometerReadingsTableData> {
  final String id;
  final String vehicleId;
  final DateTime recordedAt;
  final double mileage;
  final String source;
  final DateTime createdAt;
  const OdometerReadingsTableData({
    required this.id,
    required this.vehicleId,
    required this.recordedAt,
    required this.mileage,
    required this.source,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['vehicle_id'] = Variable<String>(vehicleId);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    map['mileage'] = Variable<double>(mileage);
    map['source'] = Variable<String>(source);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  OdometerReadingsTableCompanion toCompanion(bool nullToAbsent) {
    return OdometerReadingsTableCompanion(
      id: Value(id),
      vehicleId: Value(vehicleId),
      recordedAt: Value(recordedAt),
      mileage: Value(mileage),
      source: Value(source),
      createdAt: Value(createdAt),
    );
  }

  factory OdometerReadingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OdometerReadingsTableData(
      id: serializer.fromJson<String>(json['id']),
      vehicleId: serializer.fromJson<String>(json['vehicleId']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      mileage: serializer.fromJson<double>(json['mileage']),
      source: serializer.fromJson<String>(json['source']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'vehicleId': serializer.toJson<String>(vehicleId),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'mileage': serializer.toJson<double>(mileage),
      'source': serializer.toJson<String>(source),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  OdometerReadingsTableData copyWith({
    String? id,
    String? vehicleId,
    DateTime? recordedAt,
    double? mileage,
    String? source,
    DateTime? createdAt,
  }) => OdometerReadingsTableData(
    id: id ?? this.id,
    vehicleId: vehicleId ?? this.vehicleId,
    recordedAt: recordedAt ?? this.recordedAt,
    mileage: mileage ?? this.mileage,
    source: source ?? this.source,
    createdAt: createdAt ?? this.createdAt,
  );
  OdometerReadingsTableData copyWithCompanion(
    OdometerReadingsTableCompanion data,
  ) {
    return OdometerReadingsTableData(
      id: data.id.present ? data.id.value : this.id,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      mileage: data.mileage.present ? data.mileage.value : this.mileage,
      source: data.source.present ? data.source.value : this.source,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OdometerReadingsTableData(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('mileage: $mileage, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, vehicleId, recordedAt, mileage, source, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OdometerReadingsTableData &&
          other.id == this.id &&
          other.vehicleId == this.vehicleId &&
          other.recordedAt == this.recordedAt &&
          other.mileage == this.mileage &&
          other.source == this.source &&
          other.createdAt == this.createdAt);
}

class OdometerReadingsTableCompanion
    extends UpdateCompanion<OdometerReadingsTableData> {
  final Value<String> id;
  final Value<String> vehicleId;
  final Value<DateTime> recordedAt;
  final Value<double> mileage;
  final Value<String> source;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const OdometerReadingsTableCompanion({
    this.id = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.mileage = const Value.absent(),
    this.source = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OdometerReadingsTableCompanion.insert({
    required String id,
    required String vehicleId,
    required DateTime recordedAt,
    required double mileage,
    required String source,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       vehicleId = Value(vehicleId),
       recordedAt = Value(recordedAt),
       mileage = Value(mileage),
       source = Value(source),
       createdAt = Value(createdAt);
  static Insertable<OdometerReadingsTableData> custom({
    Expression<String>? id,
    Expression<String>? vehicleId,
    Expression<DateTime>? recordedAt,
    Expression<double>? mileage,
    Expression<String>? source,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (mileage != null) 'mileage': mileage,
      if (source != null) 'source': source,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OdometerReadingsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? vehicleId,
    Value<DateTime>? recordedAt,
    Value<double>? mileage,
    Value<String>? source,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return OdometerReadingsTableCompanion(
      id: id ?? this.id,
      vehicleId: vehicleId ?? this.vehicleId,
      recordedAt: recordedAt ?? this.recordedAt,
      mileage: mileage ?? this.mileage,
      source: source ?? this.source,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<String>(vehicleId.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (mileage.present) {
      map['mileage'] = Variable<double>(mileage.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OdometerReadingsTableCompanion(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('mileage: $mileage, ')
          ..write('source: $source, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $VehiclesTableTable vehiclesTable = $VehiclesTableTable(this);
  late final $ServiceRecordsTableTable serviceRecordsTable =
      $ServiceRecordsTableTable(this);
  late final $ServiceAttachmentsTableTable serviceAttachmentsTable =
      $ServiceAttachmentsTableTable(this);
  late final $RemindersTableTable remindersTable = $RemindersTableTable(this);
  late final $OdometerReadingsTableTable odometerReadingsTable =
      $OdometerReadingsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    vehiclesTable,
    serviceRecordsTable,
    serviceAttachmentsTable,
    remindersTable,
    odometerReadingsTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'vehicles_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('service_records_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'service_records_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [
        TableUpdate('service_attachments_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'vehicles_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('reminders_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'vehicles_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('odometer_readings_table', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$VehiclesTableTableCreateCompanionBuilder =
    VehiclesTableCompanion Function({
      required String id,
      required String brand,
      required String model,
      Value<int?> year,
      Value<String?> licensePlate,
      Value<String?> coverPhotoPath,
      required String distanceUnit,
      Value<double?> currentOdometer,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$VehiclesTableTableUpdateCompanionBuilder =
    VehiclesTableCompanion Function({
      Value<String> id,
      Value<String> brand,
      Value<String> model,
      Value<int?> year,
      Value<String?> licensePlate,
      Value<String?> coverPhotoPath,
      Value<String> distanceUnit,
      Value<double?> currentOdometer,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$VehiclesTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $VehiclesTableTable, VehiclesTableData> {
  $$VehiclesTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $ServiceRecordsTableTable,
    List<ServiceRecordsTableData>
  >
  _serviceRecordsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.serviceRecordsTable,
        aliasName: 'vehicles_table__id__service_records_table__vehicle_id',
      );

  $$ServiceRecordsTableTableProcessedTableManager get serviceRecordsTableRefs {
    final manager = $$ServiceRecordsTableTableTableManager(
      $_db,
      $_db.serviceRecordsTable,
    ).filter((f) => f.vehicleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _serviceRecordsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RemindersTableTable, List<RemindersTableData>>
  _remindersTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.remindersTable,
    aliasName: 'vehicles_table__id__reminders_table__vehicle_id',
  );

  $$RemindersTableTableProcessedTableManager get remindersTableRefs {
    final manager = $$RemindersTableTableTableManager(
      $_db,
      $_db.remindersTable,
    ).filter((f) => f.vehicleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_remindersTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $OdometerReadingsTableTable,
    List<OdometerReadingsTableData>
  >
  _odometerReadingsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.odometerReadingsTable,
        aliasName: 'vehicles_table__id__odometer_readings_table__vehicle_id',
      );

  $$OdometerReadingsTableTableProcessedTableManager
  get odometerReadingsTableRefs {
    final manager = $$OdometerReadingsTableTableTableManager(
      $_db,
      $_db.odometerReadingsTable,
    ).filter((f) => f.vehicleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _odometerReadingsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VehiclesTableTableFilterComposer
    extends Composer<_$AppDatabase, $VehiclesTableTable> {
  $$VehiclesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get licensePlate => $composableBuilder(
    column: $table.licensePlate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverPhotoPath => $composableBuilder(
    column: $table.coverPhotoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get distanceUnit => $composableBuilder(
    column: $table.distanceUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get currentOdometer => $composableBuilder(
    column: $table.currentOdometer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> serviceRecordsTableRefs(
    Expression<bool> Function($$ServiceRecordsTableTableFilterComposer f) f,
  ) {
    final $$ServiceRecordsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.serviceRecordsTable,
      getReferencedColumn: (t) => t.vehicleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceRecordsTableTableFilterComposer(
            $db: $db,
            $table: $db.serviceRecordsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> remindersTableRefs(
    Expression<bool> Function($$RemindersTableTableFilterComposer f) f,
  ) {
    final $$RemindersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.remindersTable,
      getReferencedColumn: (t) => t.vehicleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableTableFilterComposer(
            $db: $db,
            $table: $db.remindersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> odometerReadingsTableRefs(
    Expression<bool> Function($$OdometerReadingsTableTableFilterComposer f) f,
  ) {
    final $$OdometerReadingsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.odometerReadingsTable,
          getReferencedColumn: (t) => t.vehicleId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OdometerReadingsTableTableFilterComposer(
                $db: $db,
                $table: $db.odometerReadingsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$VehiclesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $VehiclesTableTable> {
  $$VehiclesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get licensePlate => $composableBuilder(
    column: $table.licensePlate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverPhotoPath => $composableBuilder(
    column: $table.coverPhotoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get distanceUnit => $composableBuilder(
    column: $table.distanceUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentOdometer => $composableBuilder(
    column: $table.currentOdometer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VehiclesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehiclesTableTable> {
  $$VehiclesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get licensePlate => $composableBuilder(
    column: $table.licensePlate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverPhotoPath => $composableBuilder(
    column: $table.coverPhotoPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get distanceUnit => $composableBuilder(
    column: $table.distanceUnit,
    builder: (column) => column,
  );

  GeneratedColumn<double> get currentOdometer => $composableBuilder(
    column: $table.currentOdometer,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> serviceRecordsTableRefs<T extends Object>(
    Expression<T> Function($$ServiceRecordsTableTableAnnotationComposer a) f,
  ) {
    final $$ServiceRecordsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.serviceRecordsTable,
          getReferencedColumn: (t) => t.vehicleId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ServiceRecordsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.serviceRecordsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> remindersTableRefs<T extends Object>(
    Expression<T> Function($$RemindersTableTableAnnotationComposer a) f,
  ) {
    final $$RemindersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.remindersTable,
      getReferencedColumn: (t) => t.vehicleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.remindersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> odometerReadingsTableRefs<T extends Object>(
    Expression<T> Function($$OdometerReadingsTableTableAnnotationComposer a) f,
  ) {
    final $$OdometerReadingsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.odometerReadingsTable,
          getReferencedColumn: (t) => t.vehicleId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OdometerReadingsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.odometerReadingsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$VehiclesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VehiclesTableTable,
          VehiclesTableData,
          $$VehiclesTableTableFilterComposer,
          $$VehiclesTableTableOrderingComposer,
          $$VehiclesTableTableAnnotationComposer,
          $$VehiclesTableTableCreateCompanionBuilder,
          $$VehiclesTableTableUpdateCompanionBuilder,
          (VehiclesTableData, $$VehiclesTableTableReferences),
          VehiclesTableData,
          PrefetchHooks Function({
            bool serviceRecordsTableRefs,
            bool remindersTableRefs,
            bool odometerReadingsTableRefs,
          })
        > {
  $$VehiclesTableTableTableManager(_$AppDatabase db, $VehiclesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehiclesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehiclesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehiclesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> brand = const Value.absent(),
                Value<String> model = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<String?> licensePlate = const Value.absent(),
                Value<String?> coverPhotoPath = const Value.absent(),
                Value<String> distanceUnit = const Value.absent(),
                Value<double?> currentOdometer = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VehiclesTableCompanion(
                id: id,
                brand: brand,
                model: model,
                year: year,
                licensePlate: licensePlate,
                coverPhotoPath: coverPhotoPath,
                distanceUnit: distanceUnit,
                currentOdometer: currentOdometer,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String brand,
                required String model,
                Value<int?> year = const Value.absent(),
                Value<String?> licensePlate = const Value.absent(),
                Value<String?> coverPhotoPath = const Value.absent(),
                required String distanceUnit,
                Value<double?> currentOdometer = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => VehiclesTableCompanion.insert(
                id: id,
                brand: brand,
                model: model,
                year: year,
                licensePlate: licensePlate,
                coverPhotoPath: coverPhotoPath,
                distanceUnit: distanceUnit,
                currentOdometer: currentOdometer,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VehiclesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                serviceRecordsTableRefs = false,
                remindersTableRefs = false,
                odometerReadingsTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (serviceRecordsTableRefs) db.serviceRecordsTable,
                    if (remindersTableRefs) db.remindersTable,
                    if (odometerReadingsTableRefs) db.odometerReadingsTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (serviceRecordsTableRefs)
                        await $_getPrefetchedData<
                          VehiclesTableData,
                          $VehiclesTableTable,
                          ServiceRecordsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$VehiclesTableTableReferences
                              ._serviceRecordsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VehiclesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).serviceRecordsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vehicleId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (remindersTableRefs)
                        await $_getPrefetchedData<
                          VehiclesTableData,
                          $VehiclesTableTable,
                          RemindersTableData
                        >(
                          currentTable: table,
                          referencedTable: $$VehiclesTableTableReferences
                              ._remindersTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VehiclesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).remindersTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vehicleId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (odometerReadingsTableRefs)
                        await $_getPrefetchedData<
                          VehiclesTableData,
                          $VehiclesTableTable,
                          OdometerReadingsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$VehiclesTableTableReferences
                              ._odometerReadingsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VehiclesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).odometerReadingsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vehicleId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$VehiclesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VehiclesTableTable,
      VehiclesTableData,
      $$VehiclesTableTableFilterComposer,
      $$VehiclesTableTableOrderingComposer,
      $$VehiclesTableTableAnnotationComposer,
      $$VehiclesTableTableCreateCompanionBuilder,
      $$VehiclesTableTableUpdateCompanionBuilder,
      (VehiclesTableData, $$VehiclesTableTableReferences),
      VehiclesTableData,
      PrefetchHooks Function({
        bool serviceRecordsTableRefs,
        bool remindersTableRefs,
        bool odometerReadingsTableRefs,
      })
    >;
typedef $$ServiceRecordsTableTableCreateCompanionBuilder =
    ServiceRecordsTableCompanion Function({
      required String id,
      required String vehicleId,
      required String type,
      required String title,
      Value<String?> providerName,
      Value<String?> notes,
      required DateTime serviceDate,
      Value<DateTime?> dueDate,
      Value<double?> mileage,
      required double totalAmount,
      Value<double> partsAmount,
      Value<double> laborAmount,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ServiceRecordsTableTableUpdateCompanionBuilder =
    ServiceRecordsTableCompanion Function({
      Value<String> id,
      Value<String> vehicleId,
      Value<String> type,
      Value<String> title,
      Value<String?> providerName,
      Value<String?> notes,
      Value<DateTime> serviceDate,
      Value<DateTime?> dueDate,
      Value<double?> mileage,
      Value<double> totalAmount,
      Value<double> partsAmount,
      Value<double> laborAmount,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ServiceRecordsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ServiceRecordsTableTable,
          ServiceRecordsTableData
        > {
  $$ServiceRecordsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $VehiclesTableTable _vehicleIdTable(_$AppDatabase db) => db
      .vehiclesTable
      .createAlias('service_records_table__vehicle_id__vehicles_table__id');

  $$VehiclesTableTableProcessedTableManager get vehicleId {
    final $_column = $_itemColumn<String>('vehicle_id')!;

    final manager = $$VehiclesTableTableTableManager(
      $_db,
      $_db.vehiclesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ServiceAttachmentsTableTable,
    List<ServiceAttachmentsTableData>
  >
  _serviceAttachmentsTableRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.serviceAttachmentsTable,
    aliasName:
        'service_records_table__id__service_attachments_table__service_record_id',
  );

  $$ServiceAttachmentsTableTableProcessedTableManager
  get serviceAttachmentsTableRefs {
    final manager =
        $$ServiceAttachmentsTableTableTableManager(
          $_db,
          $_db.serviceAttachmentsTable,
        ).filter(
          (f) => f.serviceRecordId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _serviceAttachmentsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ServiceRecordsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ServiceRecordsTableTable> {
  $$ServiceRecordsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serviceDate => $composableBuilder(
    column: $table.serviceDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get partsAmount => $composableBuilder(
    column: $table.partsAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get laborAmount => $composableBuilder(
    column: $table.laborAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$VehiclesTableTableFilterComposer get vehicleId {
    final $$VehiclesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehiclesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableTableFilterComposer(
            $db: $db,
            $table: $db.vehiclesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> serviceAttachmentsTableRefs(
    Expression<bool> Function($$ServiceAttachmentsTableTableFilterComposer f) f,
  ) {
    final $$ServiceAttachmentsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.serviceAttachmentsTable,
          getReferencedColumn: (t) => t.serviceRecordId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ServiceAttachmentsTableTableFilterComposer(
                $db: $db,
                $table: $db.serviceAttachmentsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ServiceRecordsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ServiceRecordsTableTable> {
  $$ServiceRecordsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serviceDate => $composableBuilder(
    column: $table.serviceDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get partsAmount => $composableBuilder(
    column: $table.partsAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get laborAmount => $composableBuilder(
    column: $table.laborAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$VehiclesTableTableOrderingComposer get vehicleId {
    final $$VehiclesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehiclesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableTableOrderingComposer(
            $db: $db,
            $table: $db.vehiclesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServiceRecordsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServiceRecordsTableTable> {
  $$ServiceRecordsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get serviceDate => $composableBuilder(
    column: $table.serviceDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<double> get mileage =>
      $composableBuilder(column: $table.mileage, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get partsAmount => $composableBuilder(
    column: $table.partsAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get laborAmount => $composableBuilder(
    column: $table.laborAmount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$VehiclesTableTableAnnotationComposer get vehicleId {
    final $$VehiclesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehiclesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.vehiclesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> serviceAttachmentsTableRefs<T extends Object>(
    Expression<T> Function($$ServiceAttachmentsTableTableAnnotationComposer a)
    f,
  ) {
    final $$ServiceAttachmentsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.serviceAttachmentsTable,
          getReferencedColumn: (t) => t.serviceRecordId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ServiceAttachmentsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.serviceAttachmentsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ServiceRecordsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ServiceRecordsTableTable,
          ServiceRecordsTableData,
          $$ServiceRecordsTableTableFilterComposer,
          $$ServiceRecordsTableTableOrderingComposer,
          $$ServiceRecordsTableTableAnnotationComposer,
          $$ServiceRecordsTableTableCreateCompanionBuilder,
          $$ServiceRecordsTableTableUpdateCompanionBuilder,
          (ServiceRecordsTableData, $$ServiceRecordsTableTableReferences),
          ServiceRecordsTableData,
          PrefetchHooks Function({
            bool vehicleId,
            bool serviceAttachmentsTableRefs,
          })
        > {
  $$ServiceRecordsTableTableTableManager(
    _$AppDatabase db,
    $ServiceRecordsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceRecordsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceRecordsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ServiceRecordsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> vehicleId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> providerName = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> serviceDate = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<double?> mileage = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<double> partsAmount = const Value.absent(),
                Value<double> laborAmount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ServiceRecordsTableCompanion(
                id: id,
                vehicleId: vehicleId,
                type: type,
                title: title,
                providerName: providerName,
                notes: notes,
                serviceDate: serviceDate,
                dueDate: dueDate,
                mileage: mileage,
                totalAmount: totalAmount,
                partsAmount: partsAmount,
                laborAmount: laborAmount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String vehicleId,
                required String type,
                required String title,
                Value<String?> providerName = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime serviceDate,
                Value<DateTime?> dueDate = const Value.absent(),
                Value<double?> mileage = const Value.absent(),
                required double totalAmount,
                Value<double> partsAmount = const Value.absent(),
                Value<double> laborAmount = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ServiceRecordsTableCompanion.insert(
                id: id,
                vehicleId: vehicleId,
                type: type,
                title: title,
                providerName: providerName,
                notes: notes,
                serviceDate: serviceDate,
                dueDate: dueDate,
                mileage: mileage,
                totalAmount: totalAmount,
                partsAmount: partsAmount,
                laborAmount: laborAmount,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ServiceRecordsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({vehicleId = false, serviceAttachmentsTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (serviceAttachmentsTableRefs) db.serviceAttachmentsTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (vehicleId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.vehicleId,
                                    referencedTable:
                                        $$ServiceRecordsTableTableReferences
                                            ._vehicleIdTable(db),
                                    referencedColumn:
                                        $$ServiceRecordsTableTableReferences
                                            ._vehicleIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (serviceAttachmentsTableRefs)
                        await $_getPrefetchedData<
                          ServiceRecordsTableData,
                          $ServiceRecordsTableTable,
                          ServiceAttachmentsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$ServiceRecordsTableTableReferences
                              ._serviceAttachmentsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ServiceRecordsTableTableReferences(
                                db,
                                table,
                                p0,
                              ).serviceAttachmentsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.serviceRecordId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ServiceRecordsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ServiceRecordsTableTable,
      ServiceRecordsTableData,
      $$ServiceRecordsTableTableFilterComposer,
      $$ServiceRecordsTableTableOrderingComposer,
      $$ServiceRecordsTableTableAnnotationComposer,
      $$ServiceRecordsTableTableCreateCompanionBuilder,
      $$ServiceRecordsTableTableUpdateCompanionBuilder,
      (ServiceRecordsTableData, $$ServiceRecordsTableTableReferences),
      ServiceRecordsTableData,
      PrefetchHooks Function({bool vehicleId, bool serviceAttachmentsTableRefs})
    >;
typedef $$ServiceAttachmentsTableTableCreateCompanionBuilder =
    ServiceAttachmentsTableCompanion Function({
      required String id,
      required String serviceRecordId,
      required String filePath,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ServiceAttachmentsTableTableUpdateCompanionBuilder =
    ServiceAttachmentsTableCompanion Function({
      Value<String> id,
      Value<String> serviceRecordId,
      Value<String> filePath,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$ServiceAttachmentsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ServiceAttachmentsTableTable,
          ServiceAttachmentsTableData
        > {
  $$ServiceAttachmentsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ServiceRecordsTableTable _serviceRecordIdTable(
    _$AppDatabase db,
  ) => db.serviceRecordsTable.createAlias(
    'service_attachments_table__service_record_id__service_records_table__id',
  );

  $$ServiceRecordsTableTableProcessedTableManager get serviceRecordId {
    final $_column = $_itemColumn<String>('service_record_id')!;

    final manager = $$ServiceRecordsTableTableTableManager(
      $_db,
      $_db.serviceRecordsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_serviceRecordIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ServiceAttachmentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ServiceAttachmentsTableTable> {
  $$ServiceAttachmentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ServiceRecordsTableTableFilterComposer get serviceRecordId {
    final $$ServiceRecordsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.serviceRecordId,
      referencedTable: $db.serviceRecordsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceRecordsTableTableFilterComposer(
            $db: $db,
            $table: $db.serviceRecordsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServiceAttachmentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ServiceAttachmentsTableTable> {
  $$ServiceAttachmentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ServiceRecordsTableTableOrderingComposer get serviceRecordId {
    final $$ServiceRecordsTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.serviceRecordId,
          referencedTable: $db.serviceRecordsTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ServiceRecordsTableTableOrderingComposer(
                $db: $db,
                $table: $db.serviceRecordsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ServiceAttachmentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServiceAttachmentsTableTable> {
  $$ServiceAttachmentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ServiceRecordsTableTableAnnotationComposer get serviceRecordId {
    final $$ServiceRecordsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.serviceRecordId,
          referencedTable: $db.serviceRecordsTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ServiceRecordsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.serviceRecordsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ServiceAttachmentsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ServiceAttachmentsTableTable,
          ServiceAttachmentsTableData,
          $$ServiceAttachmentsTableTableFilterComposer,
          $$ServiceAttachmentsTableTableOrderingComposer,
          $$ServiceAttachmentsTableTableAnnotationComposer,
          $$ServiceAttachmentsTableTableCreateCompanionBuilder,
          $$ServiceAttachmentsTableTableUpdateCompanionBuilder,
          (
            ServiceAttachmentsTableData,
            $$ServiceAttachmentsTableTableReferences,
          ),
          ServiceAttachmentsTableData,
          PrefetchHooks Function({bool serviceRecordId})
        > {
  $$ServiceAttachmentsTableTableTableManager(
    _$AppDatabase db,
    $ServiceAttachmentsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceAttachmentsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ServiceAttachmentsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ServiceAttachmentsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> serviceRecordId = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ServiceAttachmentsTableCompanion(
                id: id,
                serviceRecordId: serviceRecordId,
                filePath: filePath,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String serviceRecordId,
                required String filePath,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ServiceAttachmentsTableCompanion.insert(
                id: id,
                serviceRecordId: serviceRecordId,
                filePath: filePath,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ServiceAttachmentsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({serviceRecordId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (serviceRecordId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.serviceRecordId,
                                referencedTable:
                                    $$ServiceAttachmentsTableTableReferences
                                        ._serviceRecordIdTable(db),
                                referencedColumn:
                                    $$ServiceAttachmentsTableTableReferences
                                        ._serviceRecordIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ServiceAttachmentsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ServiceAttachmentsTableTable,
      ServiceAttachmentsTableData,
      $$ServiceAttachmentsTableTableFilterComposer,
      $$ServiceAttachmentsTableTableOrderingComposer,
      $$ServiceAttachmentsTableTableAnnotationComposer,
      $$ServiceAttachmentsTableTableCreateCompanionBuilder,
      $$ServiceAttachmentsTableTableUpdateCompanionBuilder,
      (ServiceAttachmentsTableData, $$ServiceAttachmentsTableTableReferences),
      ServiceAttachmentsTableData,
      PrefetchHooks Function({bool serviceRecordId})
    >;
typedef $$RemindersTableTableCreateCompanionBuilder =
    RemindersTableCompanion Function({
      required String id,
      required String vehicleId,
      required String type,
      Value<String?> title,
      Value<DateTime?> targetDate,
      Value<double?> targetMileage,
      Value<int?> recurrenceMonths,
      Value<double?> recurrenceMileage,
      Value<DateTime?> lastCompletedAt,
      Value<double?> lastCompletedMileage,
      Value<bool> isActive,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$RemindersTableTableUpdateCompanionBuilder =
    RemindersTableCompanion Function({
      Value<String> id,
      Value<String> vehicleId,
      Value<String> type,
      Value<String?> title,
      Value<DateTime?> targetDate,
      Value<double?> targetMileage,
      Value<int?> recurrenceMonths,
      Value<double?> recurrenceMileage,
      Value<DateTime?> lastCompletedAt,
      Value<double?> lastCompletedMileage,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$RemindersTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RemindersTableTable,
          RemindersTableData
        > {
  $$RemindersTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $VehiclesTableTable _vehicleIdTable(_$AppDatabase db) => db
      .vehiclesTable
      .createAlias('reminders_table__vehicle_id__vehicles_table__id');

  $$VehiclesTableTableProcessedTableManager get vehicleId {
    final $_column = $_itemColumn<String>('vehicle_id')!;

    final manager = $$VehiclesTableTableTableManager(
      $_db,
      $_db.vehiclesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RemindersTableTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTableTable> {
  $$RemindersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get targetMileage => $composableBuilder(
    column: $table.targetMileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get recurrenceMonths => $composableBuilder(
    column: $table.recurrenceMonths,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get recurrenceMileage => $composableBuilder(
    column: $table.recurrenceMileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastCompletedAt => $composableBuilder(
    column: $table.lastCompletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lastCompletedMileage => $composableBuilder(
    column: $table.lastCompletedMileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$VehiclesTableTableFilterComposer get vehicleId {
    final $$VehiclesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehiclesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableTableFilterComposer(
            $db: $db,
            $table: $db.vehiclesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTableTable> {
  $$RemindersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get targetMileage => $composableBuilder(
    column: $table.targetMileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recurrenceMonths => $composableBuilder(
    column: $table.recurrenceMonths,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get recurrenceMileage => $composableBuilder(
    column: $table.recurrenceMileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastCompletedAt => $composableBuilder(
    column: $table.lastCompletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lastCompletedMileage => $composableBuilder(
    column: $table.lastCompletedMileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$VehiclesTableTableOrderingComposer get vehicleId {
    final $$VehiclesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehiclesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableTableOrderingComposer(
            $db: $db,
            $table: $db.vehiclesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTableTable> {
  $$RemindersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get targetMileage => $composableBuilder(
    column: $table.targetMileage,
    builder: (column) => column,
  );

  GeneratedColumn<int> get recurrenceMonths => $composableBuilder(
    column: $table.recurrenceMonths,
    builder: (column) => column,
  );

  GeneratedColumn<double> get recurrenceMileage => $composableBuilder(
    column: $table.recurrenceMileage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastCompletedAt => $composableBuilder(
    column: $table.lastCompletedAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get lastCompletedMileage => $composableBuilder(
    column: $table.lastCompletedMileage,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$VehiclesTableTableAnnotationComposer get vehicleId {
    final $$VehiclesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehiclesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.vehiclesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTableTable,
          RemindersTableData,
          $$RemindersTableTableFilterComposer,
          $$RemindersTableTableOrderingComposer,
          $$RemindersTableTableAnnotationComposer,
          $$RemindersTableTableCreateCompanionBuilder,
          $$RemindersTableTableUpdateCompanionBuilder,
          (RemindersTableData, $$RemindersTableTableReferences),
          RemindersTableData,
          PrefetchHooks Function({bool vehicleId})
        > {
  $$RemindersTableTableTableManager(
    _$AppDatabase db,
    $RemindersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> vehicleId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<DateTime?> targetDate = const Value.absent(),
                Value<double?> targetMileage = const Value.absent(),
                Value<int?> recurrenceMonths = const Value.absent(),
                Value<double?> recurrenceMileage = const Value.absent(),
                Value<DateTime?> lastCompletedAt = const Value.absent(),
                Value<double?> lastCompletedMileage = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersTableCompanion(
                id: id,
                vehicleId: vehicleId,
                type: type,
                title: title,
                targetDate: targetDate,
                targetMileage: targetMileage,
                recurrenceMonths: recurrenceMonths,
                recurrenceMileage: recurrenceMileage,
                lastCompletedAt: lastCompletedAt,
                lastCompletedMileage: lastCompletedMileage,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String vehicleId,
                required String type,
                Value<String?> title = const Value.absent(),
                Value<DateTime?> targetDate = const Value.absent(),
                Value<double?> targetMileage = const Value.absent(),
                Value<int?> recurrenceMonths = const Value.absent(),
                Value<double?> recurrenceMileage = const Value.absent(),
                Value<DateTime?> lastCompletedAt = const Value.absent(),
                Value<double?> lastCompletedMileage = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => RemindersTableCompanion.insert(
                id: id,
                vehicleId: vehicleId,
                type: type,
                title: title,
                targetDate: targetDate,
                targetMileage: targetMileage,
                recurrenceMonths: recurrenceMonths,
                recurrenceMileage: recurrenceMileage,
                lastCompletedAt: lastCompletedAt,
                lastCompletedMileage: lastCompletedMileage,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RemindersTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({vehicleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (vehicleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.vehicleId,
                                referencedTable: $$RemindersTableTableReferences
                                    ._vehicleIdTable(db),
                                referencedColumn:
                                    $$RemindersTableTableReferences
                                        ._vehicleIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RemindersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTableTable,
      RemindersTableData,
      $$RemindersTableTableFilterComposer,
      $$RemindersTableTableOrderingComposer,
      $$RemindersTableTableAnnotationComposer,
      $$RemindersTableTableCreateCompanionBuilder,
      $$RemindersTableTableUpdateCompanionBuilder,
      (RemindersTableData, $$RemindersTableTableReferences),
      RemindersTableData,
      PrefetchHooks Function({bool vehicleId})
    >;
typedef $$OdometerReadingsTableTableCreateCompanionBuilder =
    OdometerReadingsTableCompanion Function({
      required String id,
      required String vehicleId,
      required DateTime recordedAt,
      required double mileage,
      required String source,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$OdometerReadingsTableTableUpdateCompanionBuilder =
    OdometerReadingsTableCompanion Function({
      Value<String> id,
      Value<String> vehicleId,
      Value<DateTime> recordedAt,
      Value<double> mileage,
      Value<String> source,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$OdometerReadingsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $OdometerReadingsTableTable,
          OdometerReadingsTableData
        > {
  $$OdometerReadingsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $VehiclesTableTable _vehicleIdTable(_$AppDatabase db) => db
      .vehiclesTable
      .createAlias('odometer_readings_table__vehicle_id__vehicles_table__id');

  $$VehiclesTableTableProcessedTableManager get vehicleId {
    final $_column = $_itemColumn<String>('vehicle_id')!;

    final manager = $$VehiclesTableTableTableManager(
      $_db,
      $_db.vehiclesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$OdometerReadingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $OdometerReadingsTableTable> {
  $$OdometerReadingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$VehiclesTableTableFilterComposer get vehicleId {
    final $$VehiclesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehiclesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableTableFilterComposer(
            $db: $db,
            $table: $db.vehiclesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OdometerReadingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OdometerReadingsTableTable> {
  $$OdometerReadingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$VehiclesTableTableOrderingComposer get vehicleId {
    final $$VehiclesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehiclesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableTableOrderingComposer(
            $db: $db,
            $table: $db.vehiclesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OdometerReadingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OdometerReadingsTableTable> {
  $$OdometerReadingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get mileage =>
      $composableBuilder(column: $table.mileage, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$VehiclesTableTableAnnotationComposer get vehicleId {
    final $$VehiclesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehiclesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.vehiclesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OdometerReadingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OdometerReadingsTableTable,
          OdometerReadingsTableData,
          $$OdometerReadingsTableTableFilterComposer,
          $$OdometerReadingsTableTableOrderingComposer,
          $$OdometerReadingsTableTableAnnotationComposer,
          $$OdometerReadingsTableTableCreateCompanionBuilder,
          $$OdometerReadingsTableTableUpdateCompanionBuilder,
          (OdometerReadingsTableData, $$OdometerReadingsTableTableReferences),
          OdometerReadingsTableData,
          PrefetchHooks Function({bool vehicleId})
        > {
  $$OdometerReadingsTableTableTableManager(
    _$AppDatabase db,
    $OdometerReadingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OdometerReadingsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$OdometerReadingsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$OdometerReadingsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> vehicleId = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<double> mileage = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OdometerReadingsTableCompanion(
                id: id,
                vehicleId: vehicleId,
                recordedAt: recordedAt,
                mileage: mileage,
                source: source,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String vehicleId,
                required DateTime recordedAt,
                required double mileage,
                required String source,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => OdometerReadingsTableCompanion.insert(
                id: id,
                vehicleId: vehicleId,
                recordedAt: recordedAt,
                mileage: mileage,
                source: source,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OdometerReadingsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({vehicleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (vehicleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.vehicleId,
                                referencedTable:
                                    $$OdometerReadingsTableTableReferences
                                        ._vehicleIdTable(db),
                                referencedColumn:
                                    $$OdometerReadingsTableTableReferences
                                        ._vehicleIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$OdometerReadingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OdometerReadingsTableTable,
      OdometerReadingsTableData,
      $$OdometerReadingsTableTableFilterComposer,
      $$OdometerReadingsTableTableOrderingComposer,
      $$OdometerReadingsTableTableAnnotationComposer,
      $$OdometerReadingsTableTableCreateCompanionBuilder,
      $$OdometerReadingsTableTableUpdateCompanionBuilder,
      (OdometerReadingsTableData, $$OdometerReadingsTableTableReferences),
      OdometerReadingsTableData,
      PrefetchHooks Function({bool vehicleId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$VehiclesTableTableTableManager get vehiclesTable =>
      $$VehiclesTableTableTableManager(_db, _db.vehiclesTable);
  $$ServiceRecordsTableTableTableManager get serviceRecordsTable =>
      $$ServiceRecordsTableTableTableManager(_db, _db.serviceRecordsTable);
  $$ServiceAttachmentsTableTableTableManager get serviceAttachmentsTable =>
      $$ServiceAttachmentsTableTableTableManager(
        _db,
        _db.serviceAttachmentsTable,
      );
  $$RemindersTableTableTableManager get remindersTable =>
      $$RemindersTableTableTableManager(_db, _db.remindersTable);
  $$OdometerReadingsTableTableTableManager get odometerReadingsTable =>
      $$OdometerReadingsTableTableTableManager(_db, _db.odometerReadingsTable);
}
