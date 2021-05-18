import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_test/app/models/config.dart';
import 'package:getx_test/app/models/user.dart';
import 'package:getx_test/core/enum/app_state.dart';
import 'package:getx_test/widgets/loading_widget.dart';

class AppService extends GetxService {
  Rx<AppState> _appState = AppState.IDEL.obs;
  AppState get appState => _appState.value;
  bool get isLoading => _appState.value == AppState.LOADING;
  bool get isDone => _appState.value == AppState.DONE;
  set state(AppState v) => _appState.value = v;

  GetStorage? _storage;
  GetStorage get storage => _storage ?? box();

  Config? _config;
  Config? get config => _config;
  void setConfig(Config v) {
    _storage!.write('kConfig', jsonEncode(v.toJson()));
  }

  Rxn<Locale> _currentLocale = Rxn<Locale>();
  Locale? get locale => _currentLocale.value;

  User? _user;
  RxBool _authenticated = false.obs;
  bool get authenticated => _authenticated.value;
  dynamic get user => _authenticated.value ? _user : false;
  set user(v) {
    if (v is bool) {
      _authenticated.value = v;

      if (!v) {
        _user = null;
      }
    } else if (v is User) {
      _user = v;
      _authenticated.value = true;
    }
  }

  @override
  void onReady() {
    super.onReady();
    state = AppState.LOADING;
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<AppService> init() async {
    // APP STATE
    ever(_appState, updateAppState);

    // STORAGE
    await GetStorage.init();
    _storage = box();

    // CONFIG
    var _sConfig = _storage!.read('kConfig');
    if (_sConfig != null) {
      print('appService: fetching config');
      _config = Config.fromJson(jsonDecode(_sConfig));
    }

    // LOCALE
    var _sLocale = _storage!.read('kLocale');
    if (_sLocale != null) {
      await updateLocale(_sLocale);
    }

    // USER
    var _sUser = _storage!.read('kUser');
    if (_sUser != null) {
      user(User.fromJson(jsonDecode(_sUser)));
    }

    return this;
  }

  Future<void> updateLocale(dynamic _sLocale) async {
    if (_sLocale is Locale) {
      _currentLocale.value = _sLocale;
    } else if (_sLocale.contains('_')) {
      _currentLocale.value =
          Locale(_sLocale.split('_')[0], _sLocale.split('_')[1]);
    } else {
      _currentLocale.value = Locale(_sLocale);
    }

    Get.updateLocale(locale!);
  }

  Future<void> updateAppState(AppState state) async {
    var _isDialogOpened = Get.isDialogOpen!;
    if (_isDialogOpened) {
      Get.back();
    }

    if (state == AppState.LOADING) {
      await Get.dialog(Scaffold(
        body: LoadingWidget(true),
      ));
    }
  }

  GetStorage box({String? name}) {
    if (name != null) {
      return _storage = GetStorage(name);
    }

    _storage ??= GetStorage();

    return _storage!;
  }
}
