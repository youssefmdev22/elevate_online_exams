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
import '../../api/datasource/questions_offline_data_source_impl.dart' as _i122;
import '../../api/datasource/subject_exams_remote_data_source_impl.dart'
    as _i76;
import '../../api/datasource/subject_remote_data_source_impl.dart' as _i886;
import '../../api/web_services/di.dart' as _i1003;
import '../../api/web_services/web_services.dart' as _i99;
import '../../data/datasource/auth_offline_data_source.dart' as _i397;
import '../../data/datasource/auth_online_data_source.dart' as _i151;
import '../../data/datasource/questions_offline_data_source.dart' as _i729;
import '../../data/datasource/questions_online_data_source.dart' as _i1032;
import '../../data/datasource/subject_exams_remote_data_source.dart' as _i135;
import '../../data/datasource/subject_remote_data_source.dart' as _i458;
import '../../data/repos/auth_repo_impl.dart' as _i666;
import '../../data/repos/questions_repo_impl.dart' as _i231;
import '../../data/repos/subject_exams_repo_impl.dart' as _i398;
import '../../data/repos/subject_repo_impl.dart' as _i1071;
import '../../domain/repos/auth_repo.dart' as _i595;
import '../../domain/repos/questions_repo.dart' as _i272;
import '../../domain/repos/subject_exams_repo.dart' as _i259;
import '../../domain/repos/subject_repo.dart' as _i462;
import '../../domain/usecase/change_password_use_case.dart' as _i1069;
import '../../domain/usecase/check_exam_questions_use_case.dart' as _i490;
import '../../domain/usecase/edit_profile_use_case.dart' as _i762;
import '../../domain/usecase/forget_password_use_case.dart' as _i206;
import '../../domain/usecase/get_all_exam_questions_use_case.dart' as _i526;
import '../../domain/usecase/get_all_result_use_case.dart' as _i1039;
import '../../domain/usecase/get_profile_data_use_case.dart' as _i104;
import '../../domain/usecase/load_saved_user_credentials_use_case.dart'
    as _i156;
import '../../domain/usecase/login_use_case.dart' as _i683;
import '../../domain/usecase/register_use_case.dart' as _i717;
import '../../domain/usecase/reset_password_use_case.dart' as _i903;
import '../../domain/usecase/save_result_use_case.dart' as _i1053;
import '../../domain/usecase/subject_exams_use_case.dart' as _i678;
import '../../domain/usecase/subject_use_case.dart' as _i190;
import '../../domain/usecase/verify_reset_code_use_case.dart' as _i389;
import '../../presentation/auth/change_password/view_models/change_password_view_model.dart'
    as _i573;
import '../../presentation/auth/edit_profile/view_models/edit_profile_view_model.dart'
    as _i112;
import '../../presentation/auth/forget_password/view_models/forget_password_view_model/forget_password_view_model.dart'
    as _i1036;
import '../../presentation/auth/forget_password/view_models/reset_password_view_model/reset_password_view_model.dart'
    as _i91;
import '../../presentation/auth/forget_password/view_models/verify_reset_code_view_model/verify_reset_code_view_model.dart'
    as _i121;
import '../../presentation/auth/login/view_models/login_view_model/login_view_model.dart'
    as _i752;
import '../../presentation/auth/register/view_models/register_view_model/register_view_model.dart'
    as _i199;
import '../../presentation/exam/view_models/exam_view_model.dart' as _i333;
import '../../presentation/home/view_models/home_view_model/home_view_model.dart'
    as _i444;
import '../../presentation/home/views/pages/explore_page/view_models/subject_view_model.dart'
    as _i703;
import '../../presentation/home/views/pages/result_page/view_model/result_view_model.dart'
    as _i679;
import '../../presentation/subject_exams/view_models/subject_exams_view_model.dart'
    as _i506;

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
    gh.factory<_i729.QuestionsOfflineDataSource>(
      () => _i122.QuestionsOfflineDataSourceImpl(),
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
    gh.factory<_i135.SubjectExamsRemoteDataSource>(
      () => _i76.SubjectExamsRemoteDataSourceImpl(gh<_i99.WebServices>()),
    );
    gh.factory<_i1032.QuestionsOnlineDataSource>(
      () => _i246.QuestionOnlineDataSourceImpl(gh<_i99.WebServices>()),
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
    gh.factory<_i272.QuestionsRepo>(
      () => _i231.QuestionsRepoImpl(
        gh<_i1032.QuestionsOnlineDataSource>(),
        gh<_i729.QuestionsOfflineDataSource>(),
      ),
    );
    gh.factory<_i1069.ChangePasswordUseCase>(
      () => _i1069.ChangePasswordUseCase(gh<_i595.AuthRepo>()),
    );
    gh.factory<_i762.EditProfileUseCase>(
      () => _i762.EditProfileUseCase(gh<_i595.AuthRepo>()),
    );
    gh.factory<_i206.ForgetPasswordUseCase>(
      () => _i206.ForgetPasswordUseCase(gh<_i595.AuthRepo>()),
    );
    gh.factory<_i104.GetProfileDataUseCase>(
      () => _i104.GetProfileDataUseCase(gh<_i595.AuthRepo>()),
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
    gh.factory<_i903.ResetPasswordUseCase>(
      () => _i903.ResetPasswordUseCase(gh<_i595.AuthRepo>()),
    );
    gh.factory<_i389.VerifyResetCodeUseCase>(
      () => _i389.VerifyResetCodeUseCase(gh<_i595.AuthRepo>()),
    );
    gh.factory<_i199.RegisterViewModel>(
      () => _i199.RegisterViewModel(gh<_i717.RegisterUseCase>()),
    );
    gh.factory<_i190.SubjectUseCase>(
      () => _i190.SubjectUseCase(gh<_i462.SubjectRepo>()),
    );
    gh.factory<_i259.SubjectExamsRepo>(
      () =>
          _i398.SubjectExamsRepoImpl(gh<_i135.SubjectExamsRemoteDataSource>()),
    );
    gh.factory<_i490.CheckExamQuestionsUseCase>(
      () => _i490.CheckExamQuestionsUseCase(gh<_i272.QuestionsRepo>()),
    );
    gh.factory<_i526.GetAllExamQuestionsUseCase>(
      () => _i526.GetAllExamQuestionsUseCase(gh<_i272.QuestionsRepo>()),
    );
    gh.factory<_i1039.GetAllResultUseCase>(
      () => _i1039.GetAllResultUseCase(gh<_i272.QuestionsRepo>()),
    );
    gh.factory<_i1053.SaveResultUseCase>(
      () => _i1053.SaveResultUseCase(gh<_i272.QuestionsRepo>()),
    );
    gh.factory<_i752.LoginViewModel>(
      () => _i752.LoginViewModel(
        gh<_i683.LoginUseCase>(),
        gh<_i156.LoadSavedUserCredentialsUseCase>(),
      ),
    );
    gh.factory<_i1036.ForgetPasswordViewModel>(
      () => _i1036.ForgetPasswordViewModel(gh<_i206.ForgetPasswordUseCase>()),
    );
    gh.factory<_i678.SubjectExamsUseCase>(
      () => _i678.SubjectExamsUseCase(gh<_i259.SubjectExamsRepo>()),
    );
    gh.factory<_i506.SubjectExamsViewModel>(
      () => _i506.SubjectExamsViewModel(gh<_i678.SubjectExamsUseCase>()),
    );
    gh.factory<_i573.ChangePasswordViewModel>(
      () => _i573.ChangePasswordViewModel(gh<_i1069.ChangePasswordUseCase>()),
    );
    gh.factory<_i121.VerifyResetCodeViewModel>(
      () => _i121.VerifyResetCodeViewModel(
        gh<_i206.ForgetPasswordUseCase>(),
        gh<_i389.VerifyResetCodeUseCase>(),
      ),
    );
    gh.factory<_i91.ResetPasswordViewModel>(
      () => _i91.ResetPasswordViewModel(gh<_i903.ResetPasswordUseCase>()),
    );
    gh.factory<_i703.SubjectViewModel>(
      () => _i703.SubjectViewModel(gh<_i190.SubjectUseCase>()),
    );
    gh.factory<_i679.ResultViewModel>(
      () => _i679.ResultViewModel(gh<_i1039.GetAllResultUseCase>()),
    );
    gh.factory<_i112.EditProfileViewModel>(
      () => _i112.EditProfileViewModel(
        gh<_i104.GetProfileDataUseCase>(),
        gh<_i762.EditProfileUseCase>(),
      ),
    );
    gh.factory<_i333.ExamViewModel>(
      () => _i333.ExamViewModel(
        gh<_i526.GetAllExamQuestionsUseCase>(),
        gh<_i490.CheckExamQuestionsUseCase>(),
        gh<_i1053.SaveResultUseCase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i1003.NetworkModule {}
