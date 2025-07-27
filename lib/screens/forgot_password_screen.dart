import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Password Reset"), centerTitle: true),
      body: Center(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 200.h),
                child: Text("Enter your email to send code for password"),
              ),
              SizedBox(height: 40.h),
              SizedBox(
                height: 50.h,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Colors.black, width: 100.w),
                    ),
                    labelText: "Enter your email address",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  final messenger = ScaffoldMessenger.of(context);
                  String email = emailController.text.trim();
                  try {
                    if (emailController.text.isEmpty) {
                      messenger.showSnackBar(
                        SnackBar(content: Text("Fill out the email")),
                      );
                    }
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email)
                        .then((_) {
                          messenger.showSnackBar(
                            SnackBar(
                              content: Text("Successfully email link sent"),
                            ),
                          );
                        });
                  } on FirebaseAuthException catch (e) {
                    log("message : ${e.code}");
                  }
                },
                child: Text(
                  "Resend email link",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
