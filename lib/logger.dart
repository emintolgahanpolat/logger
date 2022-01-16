library logger;

import 'package:flutter/foundation.dart';

class Log {
  //Error
  static void e(String msg, {String? tag}) {
    _printLog("\x1B[31m", msg, name: "Error 🔴 ${tag ?? DateTime.now()}");
  }

  //Warning
  static void w(String msg, {String? tag}) {
    _printLog("\x1B[33m", msg, name: "Warning 🟡 ${tag ?? DateTime.now()}");
  }

  //Info
  static void i(String msg, {String? tag}) {
    _printLog("\x1B[36m", msg, name: "Info 🔵 ${tag ?? DateTime.now()}");
  }

  //Debug
  static void d(String msg, {String? tag}) {
    _printLog("\x1B[32m", msg, name: "Debug 🟢 ${tag ?? DateTime.now()}");
  }

  //Verbose
  static void v(String msg, {String? tag}) {
    _printLog("\x1B[35m", msg, name: "Verbose 🟣 ${tag ?? DateTime.now()}");
  }

  //What a Terrible Failure
  static void wtf(String msg, {String? tag}) {
    _printLog("\x1B[37m", msg,
        name: "What a Terrible Failure ⚪️ ${tag ?? DateTime.now()}");
  }

  static void _printLog(String color, String msg,
      {required String name}) async {
    if (kDebugMode) {
      print(color + "devlog - " + name + "\n" + msg);
      _listener?.call(name, msg);
    }
  }

  static Function(String tag, String msg)? _listener;
  static addListener(Function(String tag, String msg) listener) {
    _listener = listener;
  }
}

void debugPrint(Object? object) {
  if (kDebugMode) print(object);
}
