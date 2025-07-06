import 'package:flutter/material.dart';

import 'AuthUI/login_screen.dart';
import 'AuthUI/signup_screen.dart';


class WelnessApp extends StatelessWidget {
  const WelnessApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welness app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: login_screen(),
    );
  }

}