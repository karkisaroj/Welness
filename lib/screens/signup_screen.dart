import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:welness/app/app_routes.dart';
import 'package:welness/services/auth_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthService _authService = AuthService();
  bool passwordVisible = false;
  bool isChecked = false;
  bool isLoading = false;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),
            Text(
              "Start your welness \njourney today.",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),
            TextFormField(
              controller: userNameController,
              decoration: InputDecoration(
                hintText: "Enter your name",
                prefixIcon: Icon(Icons.person),
                prefixIconColor: Colors.grey,
              ),
            ),
            SizedBox(height: 20.h),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter your email ",
                prefixIcon: Icon(Icons.mail),
                prefixIconColor: Colors.grey,
              ),
            ),
            SizedBox(height: 20.h),
            TextFormField(
              controller: passwordController,

              obscureText: passwordVisible,
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
                    passwordVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.black,
                  activeColor: Colors.white,
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                SizedBox(height: 30),
                Text("Remember me"),
              ],
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10.r),
                ),
                minimumSize: const Size(360, 50),
              ),
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                final navigator = Navigator.of(context);
                String userName = userNameController.text;
                String email = emailController.text;
                String password = passwordController.text;
                log("username is $userName");
                log("email is $email");
                log("Password is $password");

                if (userName.isEmpty) {
                  messenger.showSnackBar(
                    SnackBar(content: Text("please enter your name")),
                  );
                  return;
                }
                if (email.isEmpty) {
                  messenger.showSnackBar(
                    SnackBar(content: Text("Please enter your email")),
                  );
                  return;
                }
                if (password.isEmpty) {
                  messenger.showSnackBar(
                    SnackBar(content: Text("Please enter your password")),
                  );
                  return;
                }
                if (password.length < 6) {
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text("Password must be at least 6 character "),
                    ),
                  );
                  return;
                }
                //remaining firebase work here to do
                setState(() {
                  isLoading = true;
                });
                try {
                  UserCredential? result = await _authService
                      .signUpWithEmailPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                  if (!mounted) return;
                  if (result != null) {
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text("Account Created"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    navigator.pushNamed(AppRoutes.login);
                  } else {
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text("Signup failed -please try again"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                } catch (e) {
                  messenger.showSnackBar(
                    SnackBar(content: Text("Error: ${e.toString()}")),
                  );
                  log("Exception error $e");
                } finally {
                  if (mounted) {
                    setState(() {
                      isLoading = false;
                    });
                  }
                }
              },
              child: isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.black),
                      strokeWidth: 2,
                    )
                  : Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                      ),
                    ),
            ),

            SizedBox(height: 20.h),
            Center(
              child: Text("Or", style: TextStyle(fontSize: 15.h)),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10.r),
                ),
                minimumSize: Size(360, 50),
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
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                  SizedBox(width: 15.w),
                  Text("Google", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
              child: Center(
                child: Text(
                  "Already have a account? Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
