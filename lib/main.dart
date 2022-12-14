import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:test_plugin/test_plugin.dart';

Future<void> handleBackGroundMessage(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // implementation on Android:
  // https://github.com/firebase/flutterfire/blob/master/packages/firebase_messaging/firebase_messaging/android/src/main/java/io/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor.java#L141
  FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);

  // calling from Flutter
  final platformVersion = await TestPlugin().getPlatformVersion();
  print(platformVersion); // ok

  // callback should be invoked from Android 3 seconds after the start application
  TestPlugin().onMessageFromNative(callback: (message) {
    print(message); // will never be called if a handler .onBackgroundMessage is set
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
