import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:welness/app/app_routes.dart';
import 'package:welness/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;
  bool isChecked = false;
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 150.h),
            child: Column(
              children: [
                Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Welcome back!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 25.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                SizedBox(
                  height: 70.h,
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: " Enter your email",
                      prefixIcon: Icon(Icons.mail),
                      prefixIconColor: Colors.grey,
                      hintStyle: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70.h,
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      prefixIcon: Icon(Icons.lock),
                      prefixIconColor: Colors.grey,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      suffixIconColor: Colors.grey,
                      hintStyle: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      activeColor: Colors.white,
                    ),
                    SizedBox(
                      child: Text(
                        "Remember me",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                    SizedBox(width: 40.w),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.forgotpassword);
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.white, fontSize: 11.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    final navigation = Navigator.of(context);
                    if (emailController.text.isEmpty) {
                      messenger.showSnackBar(
                        SnackBar(content: Text("Fill out your email")),
                      );
                      return;
                    }

                    if (passwordController.text.isEmpty) {
                      messenger.showSnackBar(
                        SnackBar(content: Text("Fill out your password")),
                      );
                      return;
                    }

                    if (emailController.text == "admin" &&
                        passwordController.text == "admin") {
                      navigation.pushNamed(AppRoutes.adminDashboard);
                    } else {
                      try {
                        if (!mounted) return;
                        UserCredential? result = await _authService
                            .signInWithEmailPassword(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                        if (result != null) {
                          messenger.showSnackBar(
                            SnackBar(content: Text("Sign in successfull")),
                          );
                          navigation.pushNamed(AppRoutes.preference);
                        } else {
                          messenger.showSnackBar(
                            SnackBar(
                              content: Text(
                                "Signin failed \nplease trt again later",
                              ),
                            ),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          messenger.showSnackBar(
                            SnackBar(
                              content: Text("No user found by your email"),
                            ),
                          );
                          return;
                        } else if (e.code == 'wrong-password') {
                          messenger.showSnackBar(
                            SnackBar(content: Text("Wrong password")),
                          );
                          return;
                        } else {
                          messenger.showSnackBar(
                            SnackBar(
                              content: Text("Sign-in Failed: ${e.message}"),
                            ),
                          );
                          return log(
                            "Firebase Auth Error: ${e.code} - ${e.toString()}",
                          );
                        }
                      }
                    }
                    String email = emailController.text;
                    String password = passwordController.text;
                    log("email is $email");
                    log("password is $password");
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10.r),
                    ),
                    minimumSize: const Size(360, 50),
                  ),
                  child: Text("Login", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Or",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10.r),
                    ),
                    minimumSize: const Size(360, 50),
                  ),
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    final navigation = Navigator.of(context);
                    try {
                      UserCredential? result = await _authService
                          .signInWithGoogle();
                      if (result != null) {
                        messenger.showSnackBar(
                          SnackBar(content: Text("Google Sign-in Successful ")),
                        );
                        navigation.pushNamed(AppRoutes.preference);
                      } else {
                        messenger.showSnackBar(
                          SnackBar(content: Text("Google Sign-In failed")),
                        );
                      }
                    } catch (e) {
                      messenger.showSnackBar(
                        SnackBar(content: Text("Error: ${e.toString()}")),
                      );
                      log("Google Sign-in error: $e");
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/Google_Favicon_2025.svg',
                        colorFilter: ColorFilter.mode(
                          Colors.grey,
                          BlendMode.srcIn,
                        ),
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 15),
                      Text('Google', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signup);
                  },
                  child: Text(
                    "Dont have an account? Create a account",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
