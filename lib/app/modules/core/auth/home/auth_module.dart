import 'package:cuidapet_mobile/app/modules/auth/login/login_module.dart';
import 'package:cuidapet_mobile/app/modules/core/auth/home/auth_home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => AuthHomePage(
        authStore: Modular.get(),
      ),
    ),
    ModuleRoute('/login', module: LoginModule()),
  ];
}
