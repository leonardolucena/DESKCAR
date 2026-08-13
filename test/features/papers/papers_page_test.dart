import 'package:deskcar/core/errors/app_result.dart';
import 'package:deskcar/features/papers/presentation/cubit/papers_cubit.dart';
import 'package:deskcar/features/papers/presentation/pages/papers_page.dart';
import 'package:deskcar/features/repairs/domain/entities/service_record_entity.dart';
import 'package:deskcar/features/repairs/domain/repositories/service_record_repository.dart';
import 'package:deskcar/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class _FakeServiceRecordRepository implements ServiceRecordRepository {
  @override
  AppAsyncResult<ServiceRecordEntity> createRecord(ServiceRecordEntity record) {
    throw UnimplementedError();
  }

  @override
  AppAsyncResult<ServiceRecordEntity> getRecordById(String id) async {
    throw UnimplementedError();
  }

  @override
  AppAsyncResult<List<ServiceRecordEntity>> getAllRecords() async {
    return appSuccess(const []);
  }

  @override
  AppAsyncResult<ServiceRecordEntity> updateRecord(ServiceRecordEntity record) {
    throw UnimplementedError();
  }

  @override
  Stream<List<ServiceRecordEntity>> watchAllRecords() {
    return Stream.value(const []);
  }
}

void main() {
  testWidgets('PapersPage shows empty message and add button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            home: BlocProvider(
              create: (_) => PapersCubit(_FakeServiceRecordRepository())..load(),
              child: const PapersPage(),
            ),
          );
        },
      ),
    );

    await tester.pumpAndSettle();

    expect(
      find.textContaining('multas, impostos, seguros'),
      findsOneWidget,
    );
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
