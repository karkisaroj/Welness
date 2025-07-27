import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/app/app_routes.dart';
import 'package:welness/models/user.dart';
import 'package:welness/services/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    try {
      await Future.delayed(Duration(seconds: 2));

      User? firebaseUser = FirebaseAuth.instance.currentUser;
      log("Firebase user: ${firebaseUser?.email}");

      if (firebaseUser != null) {
        await _loadAppUserData(firebaseUser);

        if (AuthService.currentAppUser != null) {
          _navigateBasedOnUserType();
        } else {
          _navigateToLogin();
        }
      } else {
        _navigateToLogin();
      }
    } catch (e) {
      log("Failed loading user data: $e");
    }
  }

  Future<void> _loadAppUserData(User firebaseUser) async {
    if (firebaseUser.email == 'admin@welness.com') {
      AuthService.setCurrentUser(
        AppUser(
          id: 'admin_user',
          email: 'admin@welness.com',
          userType: 'admin',
          preferences: [],
          createdAt: DateTime.now(),
        ),
      );
      return;
    }

    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get();

    if (userDoc.exists) {
      AppUser appUser = AppUser.fromMap(
        userDoc.data() as Map<String, dynamic>,
        userDoc.id,
      );
      AuthService.setCurrentUser(appUser);
    }
  }

  void _navigateBasedOnUserType() {
    final navigation = Navigator.of(context);
    if (!mounted) return;

    if (AuthService.isAdmin) {
      navigation.pushReplacementNamed(AppRoutes.adminDashboard);
    } else if (AuthService.isUser) {
      List<String> userPreferences = AuthService.currentAppUser!.preferences;
      if (userPreferences.isNotEmpty) {
        navigation.pushReplacementNamed(
          AppRoutes.quote,
          arguments: userPreferences,
        );
      } else {
        navigation.pushReplacementNamed(AppRoutes.preference);
      }
    } else {
      log("Unknown user type");
      _navigateToLogin();
    }
  }

  void _navigateToLogin() {
    final navigation = Navigator.of(context);
    if (!mounted) return;
    navigation.pushNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.grey.shade900],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://img.freepik.com/free-vector/aesthetic-linear-wellness-studio-logo-template_742173-16816.jpg?semt=ais_hybrid&w=740",
              height: MediaQuery.of(context).size.width * 0.4.w,
              width: MediaQuery.of(context).size.height * 0.4.h,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 80),

            Text(
              "Wellness",
              style: TextStyle(
                fontSize: 32.h,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 10.h),

            Text(
              "Your wellness journey starts here",
              style: TextStyle(
                fontSize: 12.h,
                color: Colors.grey.shade400,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 40.h),

            CircularProgressIndicator(color: Colors.white, strokeWidth: 2.w),
            SizedBox(height: 10.h),

            Text(
              "Loading...",
              style: TextStyle(color: Colors.grey.shade400, fontSize: 14.h),
            ),
          ],
        ),
      ),
    );
  }
}
