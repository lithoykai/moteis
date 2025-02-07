// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;

import '../data/datasource/client/http_service.dart' as _i791;
import '../data/datasource/client/third_module.dart' as _i812;
import '../data/datasource/motels_remote_datasource.dart' as _i987;
import '../data/datasource/motels_remote_datasource_impl.dart' as _i240;
import '../data/repository/motel_repository_impl.dart' as _i50;
import '../domain/repository/motel_repository.dart' as _i212;
import '../domain/usecase/get_motels.dart' as _i452;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i519.Client>(() => registerModule.dio());
    gh.factory<_i791.HttpService>(
        () => _i791.HttpService(http: gh<_i519.Client>()));
    gh.factory<_i987.MotelsRemoteDatasource>(
        () => _i240.MotelsRemoteDatasourceImpl(http: gh<_i791.HttpService>()));
    gh.factory<_i212.MotelRepository>(() => _i50.MotelRepositoryImpl(
        datasource: gh<_i987.MotelsRemoteDatasource>()));
    gh.factory<_i452.GetMotelsUseCase>(
        () => _i452.GetMotelsUseCase(repository: gh<_i212.MotelRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i812.RegisterModule {}
