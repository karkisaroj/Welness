import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/app/app_routes.dart';
import 'package:welness/dummy_data/quotes_data.dart';
import 'package:welness/services/auth_service.dart';
import 'package:welness/models/quote.dart';
import 'dart:developer';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Quote? todaysQuote;

  @override
  void initState() {
    super.initState();
    _loadTodaysQuote();
  }

  void _loadTodaysQuote() {
    try {
      List<String> userPreferences =
          AuthService.currentAppUser?.preferences ?? [];
      log("Loading today's quote for preferences: $userPreferences");

      todaysQuote = QuotesData.getRandomQuote(userPreferences);

      if (todaysQuote != null) {
        log("Today's quote loaded: ${todaysQuote!.text}");
      } else {
        log("No quote found for preferences, using default");
        List<Quote> allQuotes = QuotesData.getQuotesByPreferences([]);
        if (allQuotes.isNotEmpty) {
          todaysQuote = allQuotes.first;
        }
      }

      setState(() {});
    } catch (e) {
      log("Error loading today's quote: $e");
    }
  }

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
            padding: EdgeInsets.only(right: 16.w),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150.w, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite_outline, color: Colors.white),
                      SizedBox(width: 8.w),
                      Text(
                        "My favourites",
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15.w),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(160.w, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Remind Me",
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, top: 30.h),
                child: Text(
                  "Today's Quote",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.h),

            ElevatedButton(
              onPressed: () {
                log("Navigating to quotes details");
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: AuthService.currentAppUser?.preferences ?? [],
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(320.w, 120.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: todaysQuote != null
                          ? '"${todaysQuote!.text}"'
                          : '"Loading your personalized quote..."',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.h,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    TextSpan(
                      text: todaysQuote != null
                          ? "\n\n- ${todaysQuote!.author.isNotEmpty ? todaysQuote!.author : 'Unknown'}"
                          : "\n\n- Loading...",
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
                  "Quote Categories",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.h),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(310.w, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: ["Motivation"],
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.emoji_events_outlined, color: Colors.white),
                  SizedBox(width: 15.w),
                  Text(
                    "Motivation",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right_outlined, color: Colors.grey),
                ],
              ),
            ),

            SizedBox(height: 15.h),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(310.w, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: ["Self-Confidence"],
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.psychology_outlined, color: Colors.white),
                  SizedBox(width: 15.w),
                  Text(
                    "Self-Confidence",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right_outlined, color: Colors.grey),
                ],
              ),
            ),

            SizedBox(height: 15.h),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(310.w, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: ["Happiness"],
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.sentiment_very_satisfied_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    "Happiness",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right_outlined, color: Colors.grey),
                ],
              ),
            ),

            SizedBox(height: 15.h),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(310.w, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: ["Letting go"],
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.free_breakfast_outlined, color: Colors.white),
                  SizedBox(width: 15.w),
                  Text(
                    "Letting go",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right_outlined, color: Colors.grey),
                ],
              ),
            ),

            SizedBox(height: 15.h),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(310.w, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: ["Achieving goals"],
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.flag_outlined, color: Colors.white),
                  SizedBox(width: 15.w),
                  Text(
                    "Achieving goals",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right_outlined, color: Colors.grey),
                ],
              ),
            ),

            SizedBox(height: 15.h),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(310.w, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: ["New"],
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.new_releases_outlined, color: Colors.white),
                  SizedBox(width: 15.w),
                  Text(
                    "New",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right_outlined, color: Colors.grey),
                ],
              ),
            ),

            SizedBox(height: 30.h),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Health Tips",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.h),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(310.w, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.air_outlined, color: Colors.white),
                  SizedBox(width: 15.w),
                  Text(
                    "Breathe to Reset",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right_outlined, color: Colors.grey),
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
