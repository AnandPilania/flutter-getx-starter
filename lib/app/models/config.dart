import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getx_test/core/helpers.dart';

class Config {
  late String appName;
  late String appVersion;
  late int appSubVersion;

  Locale? locale;
  Locale? fallbackLocale;
  List<Locale>? supportedLocale;

  bool? isAuthProtected;
  bool? isApiProtected;
  List<ApiProtectionHeaders>? apiProtectionHeaders;

  late DateTime updatedAt;

  Config({
    required this.appName,
    required this.appVersion,
    required this.appSubVersion,
    this.locale,
    this.fallbackLocale,
    this.supportedLocale,
    this.isAuthProtected,
    this.isApiProtected,
    this.apiProtectionHeaders,
    required this.updatedAt,
  });

  Config.fromJson(Map<String, dynamic> json) {
    appName = json['appName'];
    appVersion = json['appVersion'];
    appSubVersion = json['appSubVersion'];

    locale = json['locale'] != null ? parseLocale(json['locale']) : null;
    fallbackLocale = json['fallbackLocale'] != null
        ? parseLocale(json['fallbackLocale'])
        : null;
    supportedLocale = json['supportedLocale'] != null
        ? jsonDecode(json['supportedLocale'].toString())
        : null;

    isAuthProtected = json['isAuthProtected'] ?? false;
    if (json['isApiProtected'] != null) {
      isApiProtected = json['isApiProtected'] ?? false;
      if (json['apiProtectionHeaders'] != null) {
        apiProtectionHeaders =
            ApiProtectionHeaders.listFromJson(json['apiProtectionHeaders']);
      }
    }

    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};

    data['appName'] = appName;
    data['appVersion'] = appVersion;
    data['appSubVersion'] = appSubVersion;

    data['locale'] = locale != null ? locale.toString() : null;
    data['fallbackLocale'] =
        fallbackLocale != null ? fallbackLocale.toString() : null;
    data['supportedLocale'] =
        supportedLocale != null ? jsonEncode(supportedLocale!.toList()) : null;

    data['isAuthProtected'] = isAuthProtected;
    data['isApiProtected'] = isApiProtected;
    data['apiProtectionHeaders'] = apiProtectionHeaders != null
        ? jsonEncode(apiProtectionHeaders!.toList())
        : null;

    data['updatedAt'] = updatedAt.toString();

    return data;
  }
}

class ApiProtectionHeaders {
  late String key;
  late dynamic? value;

  ApiProtectionHeaders({
    required this.key,
    this.value,
  });

  ApiProtectionHeaders.fromJson(Map<String, dynamic> json) {
    print('... ${json['key']}');
    print('... ${json['value']}');
    key = json['key'];
    value = json['value'];
  }

  static List<ApiProtectionHeaders> listFromJson(list) =>
      List<ApiProtectionHeaders>.from(
          list.map((x) => ApiProtectionHeaders.fromJson(x)));

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}
