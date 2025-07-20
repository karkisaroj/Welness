import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/app/app_routes.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.login);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Dashboard",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18.h,
            color: const Color.fromARGB(255, 182, 179, 179),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15.r),
                ),
                fixedSize: Size(330.w, 100.h),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.groups_outlined, color: Colors.white, size: 55.h),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Total Users",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Poppins",
                          fontSize: 15.h,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "12343456",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 25.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Card(
            margin: EdgeInsets.all(20.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(15.r),
            ),
            child: Container(
              width: 330.w,
              height: 100.h,
              padding: EdgeInsets.all(20.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Categories",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 10.h,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "100",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 20.h,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      FloatingActionButton(
                        backgroundColor: const Color.fromARGB(255, 51, 51, 51),
                        mini: true,
                        splashColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(25.r),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.category);
                        },
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      SizedBox(height: 10.h),
                      Text("Add new", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(20.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(25.r),
            ),
            child: Container(
              width: 330.w,
              height: 100.h,
              padding: EdgeInsets.all(20.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Quotes",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 13.h,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "200",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      FloatingActionButton(
                        splashColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 51, 51, 51),
                        mini: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(25.r),
                        ),
                        onPressed: () {},
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      SizedBox(height: 10.h),
                      Text("Add new", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(20.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(25.r),
            ),
            child: Container(
              width: 330.w,
              height: 100.h,
              padding: EdgeInsets.all(20.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Health Tips",
                          style: TextStyle(fontSize: 10.h),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "50",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(25.r),
                        ),
                        mini: true,
                        backgroundColor: const Color.fromARGB(255, 51, 51, 51),
                        onPressed: () {},
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      SizedBox(height: 10.h),
                      Text("Add new", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
