import 'package:flutter/material.dart';
import 'package:welness/screens/forgot_password_screen.dart';
import 'package:welness/screens/login_screen.dart';
import 'package:welness/screens/preference.dart';
import 'package:welness/screens/quote_page.dart';
import 'package:welness/screens/signup_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String forgotpassword = '/forgot-password';
  static const String signup = '/signup';
  static const String preference = '/preference';
  static const String quote = '/quote';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => const LoginScreen(),
      // home:(context)=>const HomeScreen(),
      forgotpassword: (context) => const ForgotPasswordScreen(),
      signup: (context) => const SignupScreen(),
      preference: (context) => const Preference(),
      quote: (context) => QuotePage(
        selectedTopics:
            ModalRoute.of(context)!.settings.arguments as List<String>,
      ),
    };
  }
}
