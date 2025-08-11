import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.blue,
  colorScheme: ColorScheme.light(
    primary: Color(0xFF6C63FF),
    secondary: Color(0xFF4ECDC4),
    surface: Colors.white,
    background: Color(0xFFF8F9FA),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF6C63FF),
      foregroundColor: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(iconColor: WidgetStateProperty.all(Colors.black)),
  ),
  iconTheme: IconThemeData(color: Colors.black),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.white,
    elevation: 3,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFF5F5F5),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    hintStyle: TextStyle(color: Colors.grey),
  ),
  timePickerTheme: TimePickerThemeData(
    backgroundColor: Color(0xFFF5F5F5),
    hourMinuteTextColor: Color(0xFF262626),
    hourMinuteColor: Colors.grey,
    dayPeriodTextColor: Colors.black,
    dialBackgroundColor: Colors.white,
    dialHandColor: Colors.black,
    dialTextColor: Colors.black,
    entryModeIconColor: Colors.black,
    helpTextStyle: TextStyle(color: Colors.black),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
  ),
  textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
  hoverColor: Colors.transparent,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Colors.black,
  primarySwatch: Colors.blue,
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF6C63FF),
    secondary: Color(0xFF4ECDC4),
    surface: Color(0xFF1E1E1E),
    background: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF2D2D2D),
      foregroundColor: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(iconColor: WidgetStateProperty.all(Colors.white)),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.black,
    elevation: 3,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF1E1E1E),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    hintStyle: TextStyle(color: Colors.grey),
  ),
  timePickerTheme: TimePickerThemeData(
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
  textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  hoverColor: Colors.transparent,
);
