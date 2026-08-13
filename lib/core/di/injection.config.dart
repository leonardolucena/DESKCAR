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
import 'package:deskcar/core/router/app_router.dart' as _i650;
import 'package:deskcar/core/storage/app_paths.dart' as _i46;
import 'package:deskcar/features/garage/data/repositories/vehicle_repository_impl.dart'
    as _i618;
import 'package:deskcar/features/garage/domain/repositories/vehicle_repository.dart'
    as _i32;
import 'package:deskcar/features/garage/presentation/cubit/garage_cubit.dart'
    as _i445;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    await gh.lazySingletonAsync<_i46.AppPaths>(
      () => appModule.appPaths(),
      preResolve: true,
    );
    gh.lazySingleton<_i650.AppRouter>(() => _i650.AppRouter());
    gh.lazySingleton<_i929.AppDatabase>(
      () => appModule.appDatabase(gh<_i46.AppPaths>()),
    );
    gh.lazySingleton<_i32.VehicleRepository>(
      () => _i618.VehicleRepositoryImpl(gh<_i929.AppDatabase>()),
    );
    gh.factory<_i445.GarageCubit>(
      () => _i445.GarageCubit(gh<_i32.VehicleRepository>()),
    );
    return this;
  }
}

class _$AppModule extends _i122.AppModule {}
