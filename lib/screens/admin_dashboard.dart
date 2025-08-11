import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/app/app_routes.dart';
import 'package:welness/widgets/custom_card.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

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
            Navigator.pushNamed(context, AppRoutes.login);
          },
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          "Admin Dashboard",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),

            GradientCard(
              gradientColors: isDark
                  ? [
                      Color(0xFF6C63FF).withOpacity(0.8),
                      Color(0xFF4ECDC4).withOpacity(0.8),
                    ]
                  : [
                      Color(0xFF6C63FF).withOpacity(0.9),
                      Color(0xFF4ECDC4).withOpacity(0.9),
                    ],
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.groups_outlined,
                      color: Colors.white,
                      size: 32.h,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Users",
                          style: TextStyle(
                            color: Colors.white70,
                            fontFamily: "Poppins",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "12,343,456",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            CustomCard(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Categories",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14.sp,
                            color: isDark ? Colors.white70 : Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "100",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF6C63FF),
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF6C63FF).withOpacity(0.3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.category);
                            },
                            borderRadius: BorderRadius.circular(12.r),
                            child: Container(
                              padding: EdgeInsets.all(12.w),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 24.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Add New",
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.grey[600],
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            CustomCard(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Quotes",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14.sp,
                            color: isDark ? Colors.white70 : Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "2,847",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF4ECDC4),
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF4ECDC4).withOpacity(0.3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(12.r),
                            child: Container(
                              padding: EdgeInsets.all(12.w),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 24.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Add New",
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.grey[600],
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            CustomCard(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wellness Tips",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14.sp,
                            color: isDark ? Colors.white70 : Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "156",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFF6B6B),
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFF6B6B).withOpacity(0.3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(12.r),
                            child: Container(
                              padding: EdgeInsets.all(12.w),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 24.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Add New",
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.grey[600],
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
