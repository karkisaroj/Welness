import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/app/app_routes.dart';
import 'package:welness/screens/login_screen.dart';
import 'package:welness/app/theme.dart';

class Welness extends StatefulWidget {
  const Welness({super.key});

  @override
  State<Welness> createState() => _WelnessState();
}

class _WelnessState extends State<Welness> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        initialRoute: AppRoutes.splash,
        routes: AppRoutes.getRoutes(toggleTheme: _toggleTheme),
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _themeMode,
        home: LoginScreen(),
      ),
    );
  }
}
