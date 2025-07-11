// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/datasource/auth_online_data_source_impl.dart' as _i281;
import '../../api/web_services/di.dart' as _i1003;
import '../../api/web_services/web_services.dart' as _i99;
import '../../data/datasource/auth_online_data_source.dart' as _i151;
import '../../data/repos/auth_repo_impl.dart' as _i666;
import '../../domain/repos/auth_repo.dart' as _i595;
import '../../domain/usecase/register_use_case.dart' as _i717;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.singleton<_i361.BaseOptions>(() => networkModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => networkModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => networkModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i99.WebServices>(
      () => networkModule.provideWebServices(gh<_i361.Dio>()),
    );
    gh.factory<_i151.AuthOnlineDataSource>(
      () => _i281.AuthOnlineDataSourceImpl(gh<_i99.WebServices>()),
    );
    gh.factory<_i595.AuthRepo>(
      () => _i666.AuthRepoImpl(gh<_i151.AuthOnlineDataSource>()),
    );
    gh.factory<_i717.RegisterUseCase>(
      () => _i717.RegisterUseCase(gh<_i595.AuthRepo>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i1003.NetworkModule {}
