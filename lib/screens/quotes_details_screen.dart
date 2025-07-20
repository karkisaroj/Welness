import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuotesDetailsScreen extends StatefulWidget {
  const QuotesDetailsScreen({super.key});

  @override
  State<QuotesDetailsScreen> createState() => _QuotesDetailsScreenState();
}

class _QuotesDetailsScreenState extends State<QuotesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.keyboard_arrow_left_outlined, size: 30.h),
        ),
        title: Text(
          "Motivation",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 15.h,
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          SizedBox(
            width: 65.w,
            height: 25.h,
            child: FloatingActionButton(
              backgroundColor: Colors.grey.shade700,
              mini: true,
              onPressed: () {},
              child: Text("1/5", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(300.w, 30.h, 0, 0),
            child: FloatingActionButton(
              backgroundColor: Colors.grey.shade700,
              shape: CircleBorder(),
              onPressed: () {},
              child: Icon(
                Icons.volume_up_outlined,
                size: 30.h,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 100.h),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '"\t',
                        style: TextStyle(fontSize: 40.h, color: Colors.white),
                      ),
                      Text(
                        'The only way to do great work is to\nlove what you do.'
                        "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13.h,
                          color: Colors.white,
                          fontFamily: "Poppins",
                        ),
                      ),
                      Text(
                        '\n"',
                        style: TextStyle(fontSize: 40.h, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '- Steve Jobs',
                    style: TextStyle(
                      fontSize: 16.h,
                      color: Colors.grey,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 100.h),
          Icon(Icons.swipe_up_outlined, size: 50.h),
          SizedBox(height: 15.h),
          TextButton(
            onPressed: () {},
            child: Text(
              "Swipe up",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20.h,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 35.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite_border, size: 35.h),
              SizedBox(width: 20.w),
              Icon(Icons.local_offer_outlined, size: 35.h),
            ],
          ),
        ],
      ),
    );
  }
}
