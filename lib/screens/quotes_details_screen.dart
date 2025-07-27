import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/dummy_data/quotes_data.dart';
import '../models/quote.dart';
import '../services/auth_service.dart';

class QuotesDetailsScreen extends StatefulWidget {
  final List<String>? selectedTopics;

  const QuotesDetailsScreen({super.key, this.selectedTopics});

  @override
  State<QuotesDetailsScreen> createState() => _QuotesDetailsScreenState();
}

class _QuotesDetailsScreenState extends State<QuotesDetailsScreen> {
  List<Quote> quotes = [];
  int currentQuoteIndex = 0;
  bool isFavorite = false;
  String currentCategory = "";
  List<String> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadQuotes();
    });
  }

  void _loadQuotes() {
    try {
      List<String> userPreferences = widget.selectedTopics ?? [];

      if (userPreferences.isEmpty) {
        final arguments = ModalRoute.of(context)?.settings.arguments;
        if (arguments is List<String>) {
          userPreferences = arguments;
        } else if (arguments is List) {
          userPreferences = arguments.cast<String>();
        }
      }

      if (userPreferences.isEmpty) {
        userPreferences = AuthService.currentAppUser?.preferences ?? [];
      }

      selectedCategories = userPreferences;

      quotes = QuotesData.getQuotesByPreferences(userPreferences);

      if (quotes.isNotEmpty) {
        currentCategory = selectedCategories.length == 1
            ? selectedCategories.first
            : "Quotes";
        log(
          "Loaded ${quotes.length} quotes for categories: $selectedCategories",
        );
        log("App bar title will show: $currentCategory");
      } else {
        log("No quotes found for preferences");
        currentCategory = selectedCategories.isNotEmpty
            ? selectedCategories.join(", ")
            : "Quotes";
      }

      setState(() {});
    } catch (e, stackTrace) {
      log("Error in _loadQuotes: $e");
      log("Stack trace: $stackTrace");
      setState(() {
        quotes = [];
        currentCategory = "Quotes";
      });
    }
  }

  void _nextQuote() {
    if (quotes.isNotEmpty) {
      setState(() {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.length;
        isFavorite = false;
      });
      log("Next quote: ${currentQuoteIndex + 1}/${quotes.length}");
    }
  }

  void _previousQuote() {
    if (quotes.isNotEmpty) {
      setState(() {
        currentQuoteIndex = currentQuoteIndex > 0
            ? currentQuoteIndex - 1
            : quotes.length - 1;
        isFavorite = false;
      });
      log("Previous quote: ${currentQuoteIndex + 1}/${quotes.length}");
    }
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite ? "Added to favorites" : "Removed from favorites",
        ),
        duration: Duration(seconds: 1),
        backgroundColor: isFavorite ? Colors.green : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (quotes.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.keyboard_arrow_left_outlined, size: 30.h),
          ),
          title: Text(
            currentCategory.isNotEmpty
                ? currentCategory
                : "No Quotes Available",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 15.h,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sentiment_dissatisfied,
                size: 60.h,
                color: Colors.grey,
              ),
              SizedBox(height: 20.h),
              Text(
                "No quotes found for '${selectedCategories.join(", ")}'",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Available categories: ${QuotesData.quotesDummyList.map((q) => q['category']).toSet().join(', ')}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.sp,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Go Back"),
              ),
            ],
          ),
        ),
      );
    }

    if (currentQuoteIndex >= quotes.length) {
      currentQuoteIndex = 0;
    }

    Quote currentQuote = quotes[currentQuoteIndex];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.keyboard_arrow_left_outlined, size: 30.h),
        ),
        title: Text(
          currentCategory,
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
              child: Text(
                "${currentQuoteIndex + 1}/${quotes.length}",
                style: TextStyle(color: Colors.white, fontSize: 10.sp),
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            _nextQuote();
          } else if (details.primaryVelocity! > 0) {
            _previousQuote();
          }
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(300.w, 30.h, 0, 0),
              child: FloatingActionButton(
                backgroundColor: Colors.grey.shade700,
                shape: CircleBorder(),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Reading: \"${currentQuote.text}\""),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Icon(
                  Icons.volume_up_outlined,
                  size: 30.h,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 10.h),

            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(40.w),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(),
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(
                            color: Colors.black.withValues(),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '"${currentQuote.text}"',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontFamily: "Poppins",
                                height: 1.5,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            SizedBox(height: 20.h),

                            Text(
                              currentQuote.author.isNotEmpty
                                  ? '- ${currentQuote.author}'
                                  : '- Unknown',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey.shade400,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.italic,
                              ),
                            ),

                            SizedBox(height: 20.h),

                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.withAlpha(100),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                currentQuote.category,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontFamily: "Poppins",
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
              ),
            ),

            Icon(Icons.swipe_up_outlined, size: 50.h, color: Colors.grey),
            SizedBox(height: 15.h),
            TextButton(
              onPressed: _nextQuote,
              child: Text(
                "Swipe up for next quote",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16.sp,
                  color: Colors.grey,
                ),
              ),
            ),

            SizedBox(height: 35.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _toggleFavorite,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: 35.h,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                ),
                SizedBox(width: 20.w),

                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Sharing: \"${currentQuote.text}\" - ${currentQuote.author}",
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: Icon(Icons.share, size: 35.h, color: Colors.white),
                ),
                SizedBox(width: 20.w),

                IconButton(
                  onPressed: _previousQuote,
                  icon: Icon(
                    Icons.skip_previous,
                    size: 35.h,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20.w),

                IconButton(
                  onPressed: _nextQuote,
                  icon: Icon(Icons.skip_next, size: 35.h, color: Colors.white),
                ),
              ],
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
