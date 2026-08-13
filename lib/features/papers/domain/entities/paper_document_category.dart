import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:flutter/material.dart';

enum PaperDocumentCategory {
  fine,
  parking,
  insurance,
  checklist,
  tax,
  complexInsurance,
  registration,
  other;

  String get label => switch (this) {
        PaperDocumentCategory.fine => 'Multa',
        PaperDocumentCategory.parking => 'Taxa de estacionamento',
        PaperDocumentCategory.insurance => 'Seguro',
        PaperDocumentCategory.checklist => 'Lista de verificação',
        PaperDocumentCategory.tax => 'Imposto',
        PaperDocumentCategory.complexInsurance => 'Seguro complexo',
        PaperDocumentCategory.registration => 'Registro',
        PaperDocumentCategory.other => 'Outro documento',
      };

  ServiceRecordType get recordType => switch (this) {
        PaperDocumentCategory.fine ||
        PaperDocumentCategory.parking =>
          ServiceRecordType.fine,
        PaperDocumentCategory.insurance ||
        PaperDocumentCategory.complexInsurance =>
          ServiceRecordType.insurance,
        PaperDocumentCategory.tax => ServiceRecordType.tax,
        PaperDocumentCategory.checklist ||
        PaperDocumentCategory.registration ||
        PaperDocumentCategory.other =>
          ServiceRecordType.other,
      };

  IconData get icon => switch (this) {
        PaperDocumentCategory.fine => Icons.gavel_outlined,
        PaperDocumentCategory.parking => Icons.local_parking_outlined,
        PaperDocumentCategory.insurance => Icons.shield_outlined,
        PaperDocumentCategory.checklist => Icons.fact_check_outlined,
        PaperDocumentCategory.tax => Icons.receipt_long_outlined,
        PaperDocumentCategory.complexInsurance => Icons.security_outlined,
        PaperDocumentCategory.registration => Icons.vpn_key_outlined,
        PaperDocumentCategory.other => Icons.description_outlined,
      };

  Color get iconBackgroundColor => switch (this) {
        PaperDocumentCategory.fine => const Color(0xFFFFE8CC),
        PaperDocumentCategory.parking => const Color(0xFFFFF3CD),
        PaperDocumentCategory.insurance => const Color(0xFFE7F1FF),
        PaperDocumentCategory.checklist => const Color(0xFFD1E7DD),
        PaperDocumentCategory.tax => const Color(0xFFFFF3CD),
        PaperDocumentCategory.complexInsurance => const Color(0xFFE7F1FF),
        PaperDocumentCategory.registration => const Color(0xFFFFE8CC),
        PaperDocumentCategory.other => const Color(0xFFFFF3CD),
      };

  Color get iconColor => switch (this) {
        PaperDocumentCategory.fine => const Color(0xFF2563EB),
        PaperDocumentCategory.parking => const Color(0xFFB45309),
        PaperDocumentCategory.insurance => const Color(0xFF2563EB),
        PaperDocumentCategory.checklist => const Color(0xFF198754),
        PaperDocumentCategory.tax => const Color(0xFFB45309),
        PaperDocumentCategory.complexInsurance => const Color(0xFF2563EB),
        PaperDocumentCategory.registration => const Color(0xFFE65100),
        PaperDocumentCategory.other => const Color(0xFF6C757D),
      };

  static PaperDocumentCategory fromName(String value) {
    return PaperDocumentCategory.values.firstWhere(
      (category) => category.name == value,
      orElse: () => PaperDocumentCategory.other,
    );
  }

  static PaperDocumentCategory fromRecord(ServiceRecordEntity record) {
    final fromKey = PaperDocumentCategory.values
        .where((category) => category.name == record.categoryKey)
        .firstOrNull;
    if (fromKey != null) {
      return fromKey;
    }

    return switch (record.recordType) {
      ServiceRecordType.fine => PaperDocumentCategory.fine,
      ServiceRecordType.insurance => PaperDocumentCategory.insurance,
      ServiceRecordType.tax => PaperDocumentCategory.tax,
      _ => PaperDocumentCategory.other,
    };
  }

  static const List<PaperDocumentCategory> selectableOptions = [
    PaperDocumentCategory.fine,
    PaperDocumentCategory.parking,
    PaperDocumentCategory.insurance,
    PaperDocumentCategory.checklist,
    PaperDocumentCategory.tax,
    PaperDocumentCategory.complexInsurance,
    PaperDocumentCategory.registration,
    PaperDocumentCategory.other,
  ];
}

bool isPaperRecord(ServiceRecordEntity record) {
  return switch (record.recordType) {
    ServiceRecordType.insurance ||
    ServiceRecordType.fine ||
    ServiceRecordType.tax ||
    ServiceRecordType.other =>
      true,
    ServiceRecordType.repair || ServiceRecordType.fuel => false,
  };
}
