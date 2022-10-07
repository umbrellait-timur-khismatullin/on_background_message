import 'test_plugin_platform_interface.dart';

class TestPlugin {
  Future<String?> getPlatformVersion() {
    return TestPluginPlatform.instance.getPlatformVersion();
  }

  void onMessageFromNative({
    required Function(String message) callback,
  }) {
    return TestPluginPlatform.instance.onMessageFromNative(callback: callback);
  }
}
