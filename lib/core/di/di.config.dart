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

import '../../api/datasource/auth_offline_data_source_impl.dart' as _i622;
import '../../api/datasource/auth_online_data_source_impl.dart' as _i281;
import '../../api/datasource/subject_remote_data_source_impl.dart' as _i886;
import '../../api/web_services/di.dart' as _i1003;
import '../../api/web_services/web_services.dart' as _i99;
import '../../data/datasource/auth_offline_data_source.dart' as _i397;
import '../../data/datasource/auth_online_data_source.dart' as _i151;
import '../../data/datasource/subject_remote_data_source.dart' as _i458;
import '../../data/repos/auth_repo_impl.dart' as _i666;
import '../../data/repos/subject_repo_impl.dart' as _i1071;
import '../../domain/repos/auth_repo.dart' as _i595;
import '../../domain/repos/subject_repo.dart' as _i462;
import '../../domain/usecase/load_saved_user_credentials_use_case.dart'
    as _i156;
import '../../domain/usecase/login_use_case.dart' as _i683;
import '../../domain/usecase/register_use_case.dart' as _i717;
import '../../domain/usecase/subject_use_case.dart' as _i190;
import '../../presentation/auth/login/view_models/login_view_model/login_view_model.dart'
    as _i752;
import '../../presentation/auth/register/view_models/register_view_model/register_view_model.dart'
    as _i199;
import '../../presentation/home/view_models/home_view_model/home_view_model.dart'
    as _i444;
import '../../presentation/home/views/pages/explore_page/view_models/subject_view_model.dart'
    as _i703;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.factory<_i444.HomeViewModel>(() => _i444.HomeViewModel());
    gh.singleton<_i361.BaseOptions>(() => networkModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => networkModule.providePrettyDioLogger(),
    );
    gh.factory<_i397.AuthOfflineDataSource>(
      () => _i622.AuthOfflineDataSourceImpl(),
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
    gh.factory<_i458.SubjectRemoteDataSource>(
      () => _i886.SubjectRemoteDataSourceImpl(gh<_i99.WebServices>()),
    );
    gh.factory<_i151.AuthOnlineDataSource>(
      () => _i281.AuthOnlineDataSourceImpl(gh<_i99.WebServices>()),
    );
    gh.factory<_i462.SubjectRepo>(
      () => _i1071.SubjectRepoImpl(gh<_i458.SubjectRemoteDataSource>()),
    );
    gh.factory<_i595.AuthRepo>(
      () => _i666.AuthRepoImpl(
        gh<_i151.AuthOnlineDataSource>(),
        gh<_i397.AuthOfflineDataSource>(),
      ),
    );
    gh.factory<_i156.LoadSavedUserCredentialsUseCase>(
      () => _i156.LoadSavedUserCredentialsUseCase(gh<_i595.AuthRepo>()),
    );
    gh.factory<_i683.LoginUseCase>(
      () => _i683.LoginUseCase(gh<_i595.AuthRepo>()),
    );
    gh.factory<_i717.RegisterUseCase>(
      () => _i717.RegisterUseCase(gh<_i595.AuthRepo>()),
    );
    gh.factory<_i199.RegisterViewModel>(
      () => _i199.RegisterViewModel(gh<_i717.RegisterUseCase>()),
    );
    gh.factory<_i190.SubjectUseCase>(
      () => _i190.SubjectUseCase(gh<_i462.SubjectRepo>()),
    );
    gh.factory<_i752.LoginViewModel>(
      () => _i752.LoginViewModel(
        gh<_i683.LoginUseCase>(),
        gh<_i156.LoadSavedUserCredentialsUseCase>(),
      ),
    );
    gh.factory<_i703.SubjectViewModel>(
      () => _i703.SubjectViewModel(gh<_i190.SubjectUseCase>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i1003.NetworkModule {}
