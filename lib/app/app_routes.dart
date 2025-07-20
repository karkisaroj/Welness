import 'package:flutter/material.dart';
import 'package:welness/screens/dashboard_screen.dart';
import 'package:welness/screens/forgot_password_screen.dart';
import 'package:welness/screens/login_screen.dart';
import 'package:welness/screens/preference.dart';
import 'package:welness/screens/profile_screen.dart';
import 'package:welness/screens/quote_page.dart';
import 'package:welness/screens/quotes_details_screen.dart';
import 'package:welness/screens/signup_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String forgotpassword = '/forgot-password';
  static const String signup = '/signup';
  static const String preference = '/preference';
  static const String quote = '/quote';
  static const String dashboard = '/dashboard';
  static const String profile = "/profile";
  static const String quotes_details = "/quotes-details";

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
      dashboard: (context) => const DashboardScreen(),
      profile: (context) => const ProfileScreen(),
      quotes_details: (context) => const QuotesDetailsScreen(),
    };
  }
}
