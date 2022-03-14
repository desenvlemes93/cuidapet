import 'package:cuidapet_mobile/app/core/helpers/local_storages/flutter_secure_storage_local_security_storage_impl.dart';
import 'package:cuidapet_mobile/app/core/helpers/local_storages/local_security_storage.dart';
import 'package:cuidapet_mobile/app/core/helpers/local_storages/local_storage.dart';
import 'package:cuidapet_mobile/app/core/helpers/local_storages/shared_preferences_local_storage_impl.dart';
import 'package:cuidapet_mobile/app/core/helpers/logger.dart';
import 'package:cuidapet_mobile/app/core/rest_client/dio_rest_client.dart';
import 'package:cuidapet_mobile/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_mobile/app/modules/core/auth/auth_store.dart';
import 'package:cuidapet_mobile/app/repositories/user/user_repository.dart';
import 'package:cuidapet_mobile/app/repositories/user/user_repository_impl.dart';
import 'package:cuidapet_mobile/app/services/user/user_service.dart';
import 'package:cuidapet_mobile/app/services/user/user_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore(), export: true),
    Bind.factory<RestClient>((i) => DioRestClient(), export: true),
    Bind.lazySingleton<Logger>((i) => LoggerImpl()),
    Bind.lazySingleton<LocalStorage>((i) => SharedPreferencesLocalStorageImpl(),
        export: true),
    Bind.lazySingleton<LocalSecurityStorage>(
        (i) => FlutterSecureStorageLocalSecurityStorageImpl(),
        export: true),
    Bind.lazySingleton<UserRepository>(
        (i) => UserRepositoryImpl(restClient: i(), log: i()),
        export: true),
    Bind.lazySingleton<UserService>(
        (i) => UserServiceImpl(userRepository: i(), log: i()),
        export: true),
  ];

  @override
  final List<ModularRoute> routes = [];
}