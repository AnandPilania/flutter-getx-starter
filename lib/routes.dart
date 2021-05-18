import 'package:get/get.dart';
import 'package:getx_test/modules/splash/bindings/splash_binding.dart';
import 'package:getx_test/modules/splash/views/splash_view.dart';

import 'modules/home/views/home_view.dart';
import 'modules/home/bindings/home_binding.dart';

class Routes {
  static const SPLASH = '/splas';
  static const HOME = '/home';

  static final pages = [
    GetPage(
      name: SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
