import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/app/app_routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _logout() async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await FirebaseAuth.instance.signOut();
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
        (route) => false,
      );
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text("Error signing out: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.dashboard);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Profile",
          style: TextStyle(fontFamily: "Poppins", fontSize: 17.h),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 26, 27, 28),
                fixedSize: Size(330.w, 80.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.zero,
                ),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.h,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "john.doe@example.com",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsetsGeometry.fromLTRB(30.w, 10.h, 0, 0),
              child: Text(
                "MAKE IT YOURS",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15.h,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(310.w, 50.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10.r),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.menu_book_outlined, color: Colors.white, size: 25.h),
                SizedBox(width: 14.w),
                Text(
                  "Content preference",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 14.h,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.white,
                  size: 25.h,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsetsGeometry.fromLTRB(30.w, 10.h, 0, 0),
              child: Text(
                "ACCOUNT",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Poppins",
                  fontSize: 15.h,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(310.w, 50.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8.r),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.mode_edit_outlined, color: Colors.white, size: 25.h),
                SizedBox(width: 15.w),
                Text(
                  "Theme",
                  style: TextStyle(color: Colors.white, fontSize: 15.h),
                ),
                Spacer(),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.white,
                  size: 25.h,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(310.w, 50.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8.r),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.password, color: Colors.white, size: 25.h),
                SizedBox(width: 15.w),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 15.h,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.white,
                  size: 25.h,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(310.w, 50.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8.r),
              ),
            ),
            onPressed: _logout,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.logout, color: Colors.white, size: 25.h),
                SizedBox(width: 15.w),
                Text(
                  "logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal,
                    fontSize: 15.h,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.white,
                  size: 25.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
