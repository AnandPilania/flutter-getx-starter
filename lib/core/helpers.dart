import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

bool get isIOS => !kIsWeb && Platform.isIOS;
bool get isAndroid => !kIsWeb && Platform.isAndroid;
bool get isWeb => kIsWeb;

Locale parseLocale(String from) {
  if (from.contains('_')) {
    var _split = from.split('_');
    return Locale(_split[0], _split[1]);
  }

  return Locale(from);
}
