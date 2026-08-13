import 'dart:io';

import 'package:deskcar/core/storage/app_paths.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

QueryExecutor openDatabaseConnection(AppPaths appPaths) {
  return LazyDatabase(() async {
    final file = File(appPaths.databasePath);
    return NativeDatabase.createInBackground(file);
  });
}
