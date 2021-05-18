import 'package:get/get.dart';
import 'package:getx_test/core/services/app_service.dart';

abstract class Controller extends GetxController {
  AppService app = Get.find<AppService>();

  @override
  void onInit() {
    super.onInit();
  }
}
