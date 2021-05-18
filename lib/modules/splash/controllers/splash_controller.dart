import 'package:get/get.dart';
import 'package:getx_test/app/providers/config_provider.dart';
import 'package:getx_test/core/enum/app_state.dart';
import 'package:getx_test/core/support/controller.dart';
import 'package:getx_test/routes.dart';

class SplashController extends Controller {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();

    if (app.config == null) {
      Get.lazyPut<ConfigProvider>(() => ConfigProvider());
      await fetchConfig();
    } else {
      app.state = AppState.DONE;
      await Get.toNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  goToNext() async {
    // TODO: correct
    var _isLocaleSelected = app.box().read('kLocale');
    var _isOnboarded = app.box().read('kIsOnboarded');
    var _isLoggedIn = app.box().read('kIsOnboarded');

    if (!_isLocaleSelected) {
      var _localeResponse = await Get.toNamed('');

      if (_localeResponse == 'success') {
        goToNext();
      }
    } else if (!_isOnboarded) {
      return Get.toNamed('');
    } else if (_isLoggedIn || app.config?.updatedAt != null) {
      return Get.toNamed('');
    }

    return Get.toNamed('');
  }

  Future<void> fetchConfig() async {
    print('splashController: fetching config');
    var _provider = Get.find<ConfigProvider>();

    await _provider.getConfig().then((r) {
      if (r.status.hasError) {
        return;
      }

      app.setConfig(r.body!);
      app.state = AppState.DONE;
    });
  }
}
