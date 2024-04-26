import 'dart:developer';

import 'package:flutter/foundation.dart';

class AppLogger {
  static logI(message) {
    if (kDebugMode) log(message);
  }

  static logE(message) {
    if (kDebugMode) (message);
  }
}
