import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/app/app_routes.dart';
import 'package:welness/widgets/custom_card.dart';
import 'package:welness/widgets/profile_widgets.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback? toggleTheme;
  const ProfileScreen({super.key, this.toggleTheme});

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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.dashboard);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),

            CustomCard(
              padding: EdgeInsets.all(20.w),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFF6C63FF).withOpacity(0.3),
                        width: 3,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 35.r,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Doe",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black87,
                            fontSize: 18.sp,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "john.doe@example.com",
                          style: TextStyle(
                            color: isDark ? Colors.white70 : Colors.grey[600],
                            fontSize: 14.sp,
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF6C63FF).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            "Premium User",
                            style: TextStyle(
                              color: Color(0xFF6C63FF),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SectionHeader(title: "PERSONALIZATION"),

            ProfileTile(
              title: "Content Preferences",
              icon: Icons.favorite_outline,
              iconColor: Color(0xFFFF6B6B),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.preference);
              },
            ),

            ProfileTile(
              title: "Switch Theme",
              icon: Icons.palette_outlined,
              iconColor: Color(0xFF4ECDC4),
              onTap: widget.toggleTheme,
              trailing: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                size: 20.h,
                color: isDark ? Color(0xFF4ECDC4) : Color(0xFFFF9F43),
              ),
            ),

            SectionHeader(title: "ACCOUNT"),

            ProfileTile(
              title: "Notifications",
              icon: Icons.notifications_outlined,
              iconColor: Color(0xFFFF9F43),
              onTap: () {},
            ),

            ProfileTile(
              title: "Privacy & Security",
              icon: Icons.shield_outlined,
              iconColor: Color(0xFF6C63FF),
              onTap: () {},
            ),

            ProfileTile(
              title: "Reset Password",
              icon: Icons.lock_outline,
              iconColor: Color(0xFFFF6B6B),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.forgotpassword);
              },
            ),

            SectionHeader(title: "SUPPORT"),

            ProfileTile(
              title: "Help & Support",
              icon: Icons.help_outline,
              iconColor: Color(0xFF4ECDC4),
              onTap: () {},
            ),

            ProfileTile(
              title: "About",
              icon: Icons.info_outline,
              iconColor: Color(0xFF95A5A6),
              onTap: () {},
            ),

            SizedBox(height: 20.h),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Material(
                color: Color(0xFFFF6B6B).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
                child: InkWell(
                  onTap: _logout,
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout,
                          color: Color(0xFFFF6B6B),
                          size: 20.h,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          "Sign Out",
                          style: TextStyle(
                            color: Color(0xFFFF6B6B),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
