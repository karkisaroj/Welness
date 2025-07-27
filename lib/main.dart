// import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:welness/app/app.dart';
// import 'package:welness/services/fcm_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final FcmServices fcmServices = FcmServices();
  await Firebase.initializeApp();
  // await fcmServices.initializeCloudMessenging();
  // fcmServices.listenFCMMessage();
  // String? fcmToken = await fcmServices.getFCMToken();
  // log("fcm token: $fcmToken");
  runApp(Welness());
}
