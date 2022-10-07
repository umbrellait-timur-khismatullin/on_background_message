import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'test_plugin_platform_interface.dart';

/// An implementation of [TestPluginPlatform] that uses method channels.
class MethodChannelTestPlugin extends TestPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('test_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  void onMessageFromNative({
    required Function(String message) callback,
  }) {
    methodChannel.setMethodCallHandler((call) {
      if (call.method == 'sendMessage') {
        if (call.arguments is List) {
          callback(call.arguments[0]);
        }
      }
      return Future.value(null);
    });
  }
}
