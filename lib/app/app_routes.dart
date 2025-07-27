import 'package:flutter/material.dart';
import 'package:welness/screens/admin_dashboard.dart';
import 'package:welness/screens/category_screen.dart';
import 'package:welness/screens/dashboard_screen.dart';
import 'package:welness/screens/forgot_password_screen.dart';
import 'package:welness/screens/login_screen.dart';
import 'package:welness/screens/preference.dart';
import 'package:welness/screens/profile_screen.dart';
import 'package:welness/screens/quote_page.dart';
import 'package:welness/screens/quotes_details_screen.dart';
import 'package:welness/screens/signup_screen.dart';
import 'package:welness/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String forgotpassword = '/forgot-password';
  static const String signup = '/signup';
  static const String preference = '/preference';
  static const String quote = '/quote';
  static const String dashboard = '/dashboard';
  static const String profile = "/profile";
  static const String quotesDetails = "/quotes-details";
  static const String adminDashboard = "/adminDashboard";
  static const String category = "/category";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      login: (context) => const LoginScreen(),
      forgotpassword: (context) => const ForgotPasswordScreen(),
      signup: (context) => const SignupScreen(),
      preference: (context) => const Preference(),
      quote: (context) => QuotePage(
        selectedTopics:
            ModalRoute.of(context)!.settings.arguments as List<String>,
      ),
      dashboard: (context) => const DashboardScreen(),
      profile: (context) => const ProfileScreen(),
      quotesDetails: (context) => const QuotesDetailsScreen(),
      adminDashboard: (context) => const AdminDashboard(),
      category: (context) => const CategoryScreen(),
    };
  }
}
