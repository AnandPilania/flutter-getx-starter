import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/core/services/app_service.dart';
import 'package:getx_test/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<AppService>(() => AppService().init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KSP App',
      initialRoute: Routes.SPLASH,
      getPages: Routes.pages,
    );
  }
}
