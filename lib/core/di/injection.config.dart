// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:deskcar/core/database/app_database.dart' as _i929;
import 'package:deskcar/core/di/app_module.dart' as _i122;
import 'package:deskcar/core/preferences/theme_preferences.dart' as _i175;
import 'package:deskcar/core/router/app_router.dart' as _i650;
import 'package:deskcar/core/storage/app_paths.dart' as _i46;
import 'package:deskcar/features/garage/data/repositories/reminder_repository_impl.dart'
    as _i127;
import 'package:deskcar/features/garage/data/repositories/vehicle_repository_impl.dart'
    as _i618;
import 'package:deskcar/features/garage/domain/repositories/reminder_repository.dart'
    as _i624;
import 'package:deskcar/features/garage/domain/repositories/vehicle_repository.dart'
    as _i32;
import 'package:deskcar/features/garage/presentation/cubit/garage_cubit.dart'
    as _i445;
import 'package:deskcar/features/papers/presentation/cubit/papers_cubit.dart'
    as _i289;
import 'package:deskcar/features/repairs/data/repositories/service_record_repository_impl.dart'
    as _i1054;
import 'package:deskcar/features/repairs/domain/repositories/service_record_repository.dart'
    as _i704;
import 'package:deskcar/features/repairs/presentation/cubit/repairs_cubit.dart'
    as _i749;
import 'package:deskcar/features/reports/data/repositories/reports_repository_impl.dart'
    as _i1012;
import 'package:deskcar/features/reports/domain/repositories/reports_repository.dart'
    as _i1022;
import 'package:deskcar/features/reports/presentation/cubit/reports_cubit.dart'
    as _i832;
import 'package:deskcar/features/settings/presentation/cubit/theme_cubit.dart'
    as _i36;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => appModule.sharedPreferences(),
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i46.AppPaths>(
      () => appModule.appPaths(),
      preResolve: true,
    );
    gh.lazySingleton<_i650.AppRouter>(() => _i650.AppRouter());
    gh.lazySingleton<_i175.ThemePreferences>(
      () => _i175.ThemePreferences(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i929.AppDatabase>(
      () => appModule.appDatabase(gh<_i46.AppPaths>()),
    );
    gh.factory<_i36.ThemeCubit>(
      () => _i36.ThemeCubit(gh<_i175.ThemePreferences>()),
    );
    gh.lazySingleton<_i624.ReminderRepository>(
      () => _i127.ReminderRepositoryImpl(gh<_i929.AppDatabase>()),
    );
    gh.lazySingleton<_i704.ServiceRecordRepository>(
      () => _i1054.ServiceRecordRepositoryImpl(gh<_i929.AppDatabase>()),
    );
    gh.factory<_i289.PapersCubit>(
      () => _i289.PapersCubit(gh<_i704.ServiceRecordRepository>()),
    );
    gh.factory<_i749.RepairsCubit>(
      () => _i749.RepairsCubit(gh<_i704.ServiceRecordRepository>()),
    );
    gh.lazySingleton<_i32.VehicleRepository>(
      () => _i618.VehicleRepositoryImpl(gh<_i929.AppDatabase>()),
    );
    gh.factory<_i832.ReportsCubit>(
      () => _i832.ReportsCubit(
        gh<_i704.ServiceRecordRepository>(),
        gh<_i32.VehicleRepository>(),
      ),
    );
    gh.lazySingleton<_i1022.ReportsRepository>(
      () => _i1012.ReportsRepositoryImpl(
        gh<_i704.ServiceRecordRepository>(),
        gh<_i32.VehicleRepository>(),
      ),
    );
    gh.factory<_i445.GarageCubit>(
      () => _i445.GarageCubit(gh<_i32.VehicleRepository>()),
    );
    return this;
  }
}

class _$AppModule extends _i122.AppModule {}
