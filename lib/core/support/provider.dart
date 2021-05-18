import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:getx_test/app/models/user.dart';
import 'package:getx_test/config/constants.dart';
import 'package:getx_test/core/services/app_service.dart';

abstract class Provider extends GetConnect {
  AppService? app;

  @override
  void onInit() {
    super.onInit();

    httpClient.baseUrl = API;
  }

  @override
  void onReady() {
    app = Get.find<AppService>();

    // if (Get.isRegistered<AppService>()) {
    //   app = Get.find<AppService>();
    // } else {
    //   Get.putAsync(() => AppService().init().then((value) => app = value));
    // }

    if (app!.authenticated) _setAuthorizationHeader();

    if (app!.config!.isApiProtected!) _setOtherHeaders();

    super.onReady();
  }

  void _setAuthorizationHeader() {
    httpClient.addAuthenticator((Request request) {
      User _user = app!.user;
      request.headers['Authorization'] = 'Bearer ${_user.token}';
      return request;
    });
  }

  void _setOtherHeaders() {
    var _headers = <String, dynamic>{};

    var _config = app!.config!;

    _config.apiProtectionHeaders!.forEach((_h) {
      var _subReturn = '';
      _config.toJson().forEach((_cK, _cV) {
        if (_h.value is List<dynamic>) {
          _h.value.forEach((_hV) {
            if (_hV == _cK.toString()) {
              _subReturn =
                  (_subReturn.isNotEmpty ? '$_subReturn.' : '$_subReturn') +
                      '${_cV.toString()}';
            }
          });
          _headers['${_h.key}'] = '$_subReturn';
        } else {
          if (_cK == _h.key) {
            _headers['${_h.key}'] = '$_cV';
          } else {
            _headers['${_h.key}'] = '${_h.value}';
          }
        }
      });
    });

    httpClient.addRequestModifier((Request request) {
      _headers.forEach((k, v) {
        request.headers['$k'] = '$v';
      });

      return request;
    });
  }
}
