import 'package:get/get.dart';
import 'package:getx_test/app/providers/config_provider.dart';
import 'package:getx_test/core/enum/app_state.dart';
import 'package:getx_test/core/support/controller.dart';
import 'package:getx_test/routes.dart';

class SplashController extends Controller {
  @override
  void onInit() async {
    super.onInit();

    await _manageConfig();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _manageConfig() async {
    if (app.config == null) {
      Get.lazyPut<ConfigProvider>(() => ConfigProvider());
      await fetchConfig();
    }

    app.state = AppState.DONE;
    await Get.toNamed(Routes.HOME);
  }

  Future<void> fetchConfig() async {
    print('splashController: fetching config');
    var _provider = Get.find<ConfigProvider>();

    await _provider.getConfig().then((r) {
      if (r.status.hasError) {
        return;
      }

      app.setConfig(r.body!);
    });
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
}
