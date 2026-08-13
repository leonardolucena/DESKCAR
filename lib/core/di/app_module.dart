import 'package:deskcar/core/database/app_database.dart';
import 'package:deskcar/core/storage/app_paths.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @preResolve
  @lazySingleton
  Future<AppPaths> appPaths() => AppPaths.create();

  @lazySingleton
  AppDatabase appDatabase(AppPaths appPaths) => AppDatabase(appPaths);
}
