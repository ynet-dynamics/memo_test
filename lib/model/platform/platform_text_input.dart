import 'package:flutter/services.dart';

class PlatformTextInput {
  static const _channel = MethodChannel('channel/textInput');

  static Future<void> launchTextScreen() async {
    return _channel.invokeMethod(TextMethod.LaunchTextScreen.method);
  }

  static void textHandler(void Function(String text) onSuccess,
      {void Function(Error error)? onError}) {
    _channel.setMethodCallHandler((call) {
      if (call.method == TextMethod.SendText.method) {
        if (call.arguments is String) {
          onSuccess(call.arguments);
        } else {
          if (onError != null) {
            onError(TypeError());
          }
        }
      }
      return Future.value(null);
    });
  }
}

enum TextMethod { LaunchTextScreen, SendText }

extension TextMethodExt on TextMethod {
  String get method {
    switch (this) {
      case TextMethod.LaunchTextScreen:
        return "LaunchTextScreen";
      case TextMethod.SendText:
        return "SendText";
      default:
        return "Unknown";
    }
  }
}
