import 'package:deskcar/core/database/app_database.dart';
import 'package:deskcar/core/errors/app_result.dart';
import 'package:deskcar/features/garage/data/mappers/reminder_mapper.dart';
import 'package:deskcar/features/garage/domain/entities/reminder_entity.dart';
import 'package:deskcar/features/garage/domain/repositories/reminder_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ReminderRepository)
class ReminderRepositoryImpl implements ReminderRepository {
  ReminderRepositoryImpl(this._database);

  final AppDatabase _database;

  @override
  AppAsyncResult<ReminderEntity> createReminder(ReminderEntity reminder) {
    return runAppResult(() async {
      await _database.into(_database.remindersTable).insert(reminder.toCompanion());
      return reminder;
    });
  }
}
