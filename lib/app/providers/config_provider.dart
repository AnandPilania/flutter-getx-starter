import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_test/app/models/config.dart';
import 'package:getx_test/core/support/provider.dart';

class ConfigProvider extends Provider {
  Future<Response<Config>> getConfig() async =>
      await get('/config', decoder: (r) => Config.fromJson(r));
}
