import 'package:cuidapet_mobile/app/core/ui_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/auth/');
    return ScreenUtilInit(
      designSize: const Size(390, 884),
      builder: () => MaterialApp.router(
        builder: asuka.builder,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        title: UiConfig.title,
        theme: UiConfig.theme,
      ),
    );

    // return ScreenUtilInit(
    //   designSize: const Size(390, 884),
    //   builder: () => MaterialApp(
    //     initialRoute: '/auth/',
    //     builder: asuka.builder,
    //     navigatorObservers: [
    //       asuka.asukaHeroController,
    //     ],

    //     theme: UiConfig.theme,
    //   ).modular(),
    // );
  }
}
