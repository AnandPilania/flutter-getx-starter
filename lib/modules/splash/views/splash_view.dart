import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/modules/splash/controllers/splash_controller.dart';
import 'package:getx_test/widgets/loading_widget.dart';

class SplashView extends GetView {
  @override
  Widget build(BuildContext context) {
    var _c = Get.find<SplashController>();

    return Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
