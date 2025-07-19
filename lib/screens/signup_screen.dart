import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:welness/app/app_routes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordVisible = false;
  bool isChecked = false;
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
              onPressed: () {
                String userName = userNameController.text;
                String email = emailController.text;
                String password = passwordController.text;
                log("username is $userName");
                log("email is $email");
                log("Password is $password");
                //remaining firebase work here to do
              },
              child: Text(
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
              onPressed: () {},
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
