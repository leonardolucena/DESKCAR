import 'package:deskcar/core/database/app_database.dart';
import 'package:deskcar/core/storage/app_paths.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> sharedPreferences() =>
      SharedPreferences.getInstance();

  @preResolve
  @lazySingleton
  Future<AppPaths> appPaths() => AppPaths.create();

  @lazySingleton
  AppDatabase appDatabase(AppPaths appPaths) => AppDatabase(appPaths);
}
