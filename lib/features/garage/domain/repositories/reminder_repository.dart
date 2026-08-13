import 'package:deskcar/core/errors/app_result.dart';
import 'package:deskcar/features/garage/domain/entities/reminder_entity.dart';

abstract interface class ReminderRepository {
  AppAsyncResult<ReminderEntity> createReminder(ReminderEntity reminder);
}
