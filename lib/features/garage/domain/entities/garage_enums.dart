enum VehicleType {
  car,
  motorcycle,
  other;

  String get storageValue => name;

  static VehicleType fromStorage(String value) {
    return VehicleType.values.firstWhere(
      (type) => type.name == value,
      orElse: () => VehicleType.car,
    );
  }

  String get label => switch (this) {
        VehicleType.car => 'carro',
        VehicleType.motorcycle => 'moto',
        VehicleType.other => 'outra',
      };
}

enum DistanceUnit {
  km,
  mi,
  hours;

  String get storageValue => name;

  static DistanceUnit fromStorage(String value) {
    return DistanceUnit.values.firstWhere(
      (unit) => unit.name == value,
      orElse: () => DistanceUnit.km,
    );
  }

  String get label => switch (this) {
        DistanceUnit.km => 'km',
        DistanceUnit.mi => 'mi',
        DistanceUnit.hours => 'h',
      };

  String get intervalSuffix => switch (this) {
        DistanceUnit.km => 'km',
        DistanceUnit.mi => 'mi',
        DistanceUnit.hours => 'h',
      };
}

enum ServiceRecordType {
  repair,
  insurance,
  fine,
  tax,
  fuel,
  other;

  String get storageValue => name;

  static ServiceRecordType fromStorage(String value) {
    return ServiceRecordType.values.firstWhere(
      (type) => type.name == value,
      orElse: () => ServiceRecordType.other,
    );
  }
}

enum ReminderType {
  oilChange,
  filters,
  brakeFluid,
  insurance,
  tires,
  inspection,
  custom;

  String get storageValue => switch (this) {
        ReminderType.oilChange => 'oil_change',
        ReminderType.filters => 'filters',
        ReminderType.brakeFluid => 'brake_fluid',
        ReminderType.insurance => 'insurance',
        ReminderType.tires => 'tires',
        ReminderType.inspection => 'inspection',
        ReminderType.custom => 'custom',
      };

  static ReminderType fromStorage(String value) {
    return ReminderType.values.firstWhere(
      (type) => type.storageValue == value,
      orElse: () => ReminderType.custom,
    );
  }
}

enum OdometerReadingSource {
  service,
  manual;

  String get storageValue => name;

  static OdometerReadingSource fromStorage(String value) {
    return OdometerReadingSource.values.firstWhere(
      (source) => source.name == value,
      orElse: () => OdometerReadingSource.manual,
    );
  }
}
