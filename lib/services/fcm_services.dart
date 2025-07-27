import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FcmServices {
  Future<void> initializeCloudMessenging() => Future.wait([
    FirebaseMessaging.instance.requestPermission(),
    FirebaseMessaging.instance.setAutoInitEnabled(true),
  ]);
  Future<String?> getFCMToken() => FirebaseMessaging.instance.getToken();

  void listenFCMMessage() {
    FirebaseMessaging.onMessage.listen(_handleFCMessage);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("Notification opened: ${message.notification?.title}");
    });
  }

  Future<void> _handleFCMessage(RemoteMessage message) async {
    log("Received FCM message ${message.notification?.title}");
  }
}
