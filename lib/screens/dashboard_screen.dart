import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/app/app_routes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explore",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20.h,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 16.w),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.profile);
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8.r),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.favorite_outline, color: Colors.white),
                    SizedBox(width: 10.w),
                    Text(
                      "My favourites",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 1.w),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8.r),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.w),
                    Text("Remind Me", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Text(
                "Today's Quotes",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 17.h,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(360, 120),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(15.r),
              ),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "\"Your welness is an investment,\nnot an expense.",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14.h,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  TextSpan(
                    text: "\n\t\n- Author Name",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10.h,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                "Quotes",
                style: TextStyle(
                  fontSize: 17.h,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(310.w, 40.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.light_mode_outlined, color: Colors.white),
                SizedBox(width: 10.w),
                Text("Feeling blessed", style: TextStyle(color: Colors.white)),
                Spacer(),
                Icon(Icons.keyboard_arrow_right_outlined, color: Colors.white),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(310.w, 40.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.favorite_border, color: Colors.white),
                SizedBox(width: 10.w),
                Text("Pride Month", style: TextStyle(color: Colors.white)),
                Spacer(),
                Icon(Icons.keyboard_arrow_right_outlined, color: Colors.white),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(310.w, 40.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8.r),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.star_outline_outlined, color: Colors.white),
                SizedBox(width: 10.w),
                Text("Self-worth", style: TextStyle(color: Colors.white)),
                Spacer(),
                Icon(Icons.keyboard_arrow_right_outlined, color: Colors.white),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(310.w, 40.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8.r),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.favorite, color: Colors.white),
                SizedBox(width: 10.w),
                Text("Love", style: TextStyle(color: Colors.white)),
                Spacer(),
                Icon(Icons.keyboard_arrow_right_outlined, color: Colors.white),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                "Health Tips",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15.h,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(310.w, 40.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8.r),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.light_mode_outlined, color: Colors.white),
                SizedBox(width: 10.w),
                Text("Breathe to Reset", style: TextStyle(color: Colors.white)),
                Spacer(),
                Icon(Icons.keyboard_arrow_right_outlined, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
