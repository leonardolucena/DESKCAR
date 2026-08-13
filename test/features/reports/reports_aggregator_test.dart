import 'package:deskcar/features/garage/domain/entities/garage_enums.dart';
import 'package:deskcar/features/reports/domain/entities/reports_expense_bucket.dart';
import 'package:deskcar/features/reports/domain/entities/reports_period.dart';
import 'package:deskcar/features/reports/domain/services/reports_aggregator.dart';
import 'package:deskcar/features/repairs/domain/entities/repair_category.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final reference = DateTime(2026, 8, 13);

  ServiceRecordEntity record({
    required String id,
    required DateTime serviceDate,
    required double totalAmount,
    ServiceRecordType recordType = ServiceRecordType.repair,
    bool includeAccessoryCosts = false,
    double? mileage,
  }) {
    return ServiceRecordEntity(
      id: id,
      vehicleId: 'vehicle-1',
      title: 'Serviço',
      categoryKey: RepairCategory.other.name,
      serviceDate: serviceDate,
      mileage: mileage,
      totalAmount: totalAmount,
      partsAmount: 0,
      laborAmount: 0,
      distanceUnit: DistanceUnit.km,
      includeAccessoryCosts: includeAccessoryCosts,
      recordType: recordType,
      createdAt: serviceDate,
      updatedAt: serviceDate,
    );
  }

  test('classifies records into report buckets', () {
    expect(
      reportsBucketFor(
        record(
          id: '1',
          serviceDate: reference,
          totalAmount: 100,
        ),
      ),
      ReportsExpenseBucket.repairs,
    );
    expect(
      reportsBucketFor(
        record(
          id: '2',
          serviceDate: reference,
          totalAmount: 100,
          includeAccessoryCosts: true,
        ),
      ),
      ReportsExpenseBucket.accessories,
    );
    expect(
      reportsBucketFor(
        record(
          id: '3',
          serviceDate: reference,
          totalAmount: 100,
          recordType: ServiceRecordType.insurance,
        ),
      ),
      ReportsExpenseBucket.papers,
    );
    expect(
      reportsBucketFor(
        record(
          id: '4',
          serviceDate: reference,
          totalAmount: 100,
          recordType: ServiceRecordType.fuel,
        ),
      ),
      ReportsExpenseBucket.repairs,
    );
  });

  test('aggregates summary totals and monthly expenses for this year', () {
    final data = ReportsAggregator.aggregate(
      records: [
        record(
          id: 'repair',
          serviceDate: DateTime(2026, 3, 10),
          totalAmount: 1500,
        ),
        record(
          id: 'accessory',
          serviceDate: DateTime(2026, 4, 5),
          totalAmount: 500,
          includeAccessoryCosts: true,
        ),
        record(
          id: 'paper',
          serviceDate: DateTime(2026, 5, 20),
          totalAmount: 300,
          recordType: ServiceRecordType.tax,
        ),
        record(
          id: 'mileage',
          serviceDate: DateTime(2026, 6, 1),
          totalAmount: 800,
          mileage: 52000,
        ),
      ],
      period: ReportsPeriod.thisYear,
      now: reference,
    );

    expect(data.summary.repairsTotal, 2300);
    expect(data.summary.accessoriesTotal, 500);
    expect(data.summary.papersTotal, 300);
    expect(data.summary.total, 3100);
    expect(data.months.first, DateTime(2026, 1));
    expect(data.months.last, DateTime(2026, 8));
    expect(data.totalExpensesByMonth[2], 1500);
    expect(data.mileageByMonth[5], 52000);
    expect(data.mileageByMonth[6], 52000);
    expect(data.mileageByMonth[7], 52000);
    expect(data.mileageYMax, 60000);
    expect(data.expenseYMax, lessThanOrEqualTo(4));
  });

  test('filters records by rolling one year period', () {
    final data = ReportsAggregator.aggregate(
      records: [
        record(
          id: 'old',
          serviceDate: DateTime(2025, 6, 1),
          totalAmount: 999,
        ),
        record(
          id: 'recent',
          serviceDate: DateTime(2026, 2, 1),
          totalAmount: 100,
        ),
      ],
      period: ReportsPeriod.oneYear,
      now: reference,
    );

    expect(data.summary.total, 100);
    expect(data.months.first, DateTime(2025, 9));
  });
}
