import 'package:flutter/material.dart';
import 'package:welness/AuthUI/login_screen.dart';
import 'package:welness/UserUI/HomeUI.dart';


class WelnessApp extends StatelessWidget {
  const WelnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          secondary: Color(0xFF262626),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all(Colors.white),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.black,
          elevation: 3,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF1E1E1E),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        timePickerTheme: const TimePickerThemeData(
          backgroundColor: Color(0xFF1E1E1E),
          hourMinuteTextColor: Color(0xFF1E1E1E),
          hourMinuteColor: Colors.grey,
          dayPeriodTextColor: Colors.white70,
          dialBackgroundColor: Colors.black,
          dialHandColor: Colors.white,
          dialTextColor: Colors.white,
          entryModeIconColor: Colors.white,
          helpTextStyle: TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        hoverColor: Colors.transparent,
      ),
      home: const login_screen(), // Change to your desired start page
    );
  }
}