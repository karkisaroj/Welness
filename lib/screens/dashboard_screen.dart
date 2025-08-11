import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/app/app_routes.dart';
import 'package:welness/dummy_data/quotes_data.dart';
import 'package:welness/services/auth_service.dart';
import 'package:welness/models/quote.dart';
import 'package:welness/widgets/custom_card.dart';
import 'package:welness/widgets/custom_button.dart';
import 'package:welness/widgets/favorite_button.dart';
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Color(0xFFF8F9FA),
        elevation: 0,
        title: Text(
          "Explore",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: isDark ? Colors.white : Colors.black87,
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
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xFF6C63FF).withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GradientCard(
                    margin: EdgeInsets.only(left: 20.w, right: 8.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.favorites);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_outline,
                          color: Color(0xFFFF6B6B),
                          size: 20.h,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "Favorites",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black87,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GradientCard(
                    margin: EdgeInsets.only(left: 8.w, right: 20.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          color: Color(0xFF4ECDC4),
                          size: 20.h,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "Reminders",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black87,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(30.w, 30.h, 30.w, 15.h),
              child: Text(
                "Today's Quote",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ),

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
              onTap: () {
                log("Navigating to quotes details");
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: AuthService.currentAppUser?.preferences ?? [],
                );
              },
              child: Container(
                height: 140.h,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            todaysQuote != null
                                ? '"${todaysQuote!.text}"'
                                : '"Loading your personalized quote..."',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            todaysQuote != null
                                ? "— ${todaysQuote!.author.isNotEmpty ? todaysQuote!.author : 'Sam Levenson'}"
                                : "— Loading...",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12.sp,
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (todaysQuote != null)
                      Positioned(
                        top: 8.h,
                        right: 8.w,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: FavoriteButton(
                            quote: todaysQuote!,
                            size: 20.h,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(30.w, 30.h, 30.w, 15.h),
              child: Text(
                "Quote Categories",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ),

            CategoryButton(
              title: "Motivation",
              icon: Icons.emoji_events_outlined,
              iconColor: Color(0xFFFF9F43),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: ["Motivation"],
                );
              },
            ),

            CategoryButton(
              title: "Self-Confidence",
              icon: Icons.psychology_outlined,
              iconColor: Color(0xFF6C63FF),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: ["Self-Confidence"],
                );
              },
            ),

            CategoryButton(
              title: "Happiness",
              icon: Icons.sentiment_very_satisfied_outlined,
              iconColor: Color(0xFFFF6B6B),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: ["Happiness"],
                );
              },
            ),

            CategoryButton(
              title: "Letting Go",
              icon: Icons.free_breakfast_outlined,
              iconColor: Color(0xFF4ECDC4),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: ["Letting go"],
                );
              },
            ),

            CategoryButton(
              title: "Achieving Goals",
              icon: Icons.flag_outlined,
              iconColor: Color(0xFF95A5A6),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: ["Achieving goals"],
                );
              },
            ),

            CategoryButton(
              title: "New",
              icon: Icons.new_releases_outlined,
              iconColor: Color(0xFFE74C3C),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.quotesDetails,
                  arguments: ["New"],
                );
              },
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(30.w, 30.h, 30.w, 15.h),
              child: Text(
                "Wellness Tips",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ),

            CategoryButton(
              title: "Breathe to Reset",
              icon: Icons.air_outlined,
              iconColor: Color(0xFF27AE60),
              onPressed: () {},
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
