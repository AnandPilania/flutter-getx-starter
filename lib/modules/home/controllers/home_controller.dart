import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_test/core/enum/app_state.dart';
import 'package:getx_test/core/support/controller.dart';

class HomeController extends Controller {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();

    Timer.periodic(5.seconds, (timer) {
      if (app.appState == AppState.LOADING) {
        app.state = AppState.DONE;
      } else {
        app.state = AppState.LOADING;
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
