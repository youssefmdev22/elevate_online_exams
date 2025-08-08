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
import '../../api/datasource/question_online_data_source_impl.dart' as _i246;
import '../../api/web_services/di.dart' as _i1003;
import '../../api/web_services/web_services.dart' as _i99;
import '../../data/datasource/auth_offline_data_source.dart' as _i397;
import '../../data/datasource/auth_online_data_source.dart' as _i151;
import '../../data/datasource/questions_online_data_source.dart' as _i1032;
import '../../data/repos/auth_repo_impl.dart' as _i666;
import '../../data/repos/questions_repo_impl.dart' as _i231;
import '../../domain/repos/auth_repo.dart' as _i595;
import '../../domain/repos/questions_repo.dart' as _i272;
import '../../domain/usecase/check_exam_questions_use_case.dart' as _i490;
import '../../domain/usecase/get_all_exam_questions_use_case.dart' as _i526;
import '../../domain/usecase/load_saved_user_credentials_use_case.dart'
    as _i156;
import '../../domain/usecase/login_use_case.dart' as _i683;
import '../../domain/usecase/register_use_case.dart' as _i717;
import '../../presentation/auth/login/view_models/login_view_model/login_view_model.dart'
    as _i752;
import '../../presentation/auth/register/view_models/register_view_model/register_view_model.dart'
    as _i199;
import '../../presentation/exam/view_models/exam_view_model.dart' as _i333;

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
    gh.factory<_i1032.QuestionsOnlineDataSource>(
      () => _i246.QuestionOnlineDataSourceImpl(gh<_i99.WebServices>()),
    );
    gh.factory<_i151.AuthOnlineDataSource>(
      () => _i281.AuthOnlineDataSourceImpl(gh<_i99.WebServices>()),
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
    gh.factory<_i272.QuestionsRepo>(
      () => _i231.QuestionsRepoImpl(gh<_i1032.QuestionsOnlineDataSource>()),
    );
    gh.factory<_i490.CheckExamQuestionsUseCase>(
      () => _i490.CheckExamQuestionsUseCase(gh<_i272.QuestionsRepo>()),
    );
    gh.factory<_i526.GetAllExamQuestionsUseCase>(
      () => _i526.GetAllExamQuestionsUseCase(gh<_i272.QuestionsRepo>()),
    );
    gh.factory<_i752.LoginViewModel>(
      () => _i752.LoginViewModel(
        gh<_i683.LoginUseCase>(),
        gh<_i156.LoadSavedUserCredentialsUseCase>(),
      ),
    );
    gh.factory<_i333.ExamViewModel>(
      () => _i333.ExamViewModel(
        gh<_i526.GetAllExamQuestionsUseCase>(),
        gh<_i490.CheckExamQuestionsUseCase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i1003.NetworkModule {}
