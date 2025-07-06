import 'package:flutter/material.dart';

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  // Example quotes
  List<Map<String, String>> quotes = [
    {
      "quote": "The only way to do great work is to love what you do.",
      "author": "Steve Jobs",
    },
    {
      "quote": "Success is not the key to happiness. Happiness is the key to success.",
      "author": "Albert Schweitzer",
    },
    {
      "quote": "Your limitation—it's only your imagination.",
      "author": "Unknown",
    },
    {
      "quote": "Push yourself, because no one else is going to do it for you.",
      "author": "Unknown",
    },
    {
      "quote": "Great things never come from comfort zones.",
      "author": "Unknown",
    },
    // Add more quotes as needed
  ];

  int currentIndex = 0;
  double dragStartDy = 0;

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    // Track drag direction if needed (not required here)
  }

  void _onVerticalDragStart(DragStartDetails details) {
    dragStartDy = details.localPosition.dy;
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    // Not needed, action is onUpdate or onEnd after threshold
  }

  void _onVerticalDragCancel() {}

  void _onVerticalDrag(DragUpdateDetails details) {
    // Detect swipe up: if drag is negative and exceeds a threshold
    if (details.delta.dy < -10) {
      setState(() {
        if (currentIndex < quotes.length - 1) {
          currentIndex++;
        } else {
          currentIndex = 0; // Loop back to first quote if at the end
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String quoteText = quotes[currentIndex]["quote"] ?? "";
    String author = quotes[currentIndex]["author"] ?? "";
    int total = quotes.length;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy < -10) {
              setState(() {
                if (currentIndex < quotes.length - 1) {
                  currentIndex++;
                } else {
                  currentIndex = 0;
                }
              });
            }
          },
          child: Stack(
            children: [
              // Top Bar
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back arrow
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 26),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "Motivation",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "${currentIndex + 1}/$total",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 14),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white12,
                            ),
                            child: Icon(
                              Icons.volume_up_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Center Quote
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 3),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Text(
                        "❝ $quoteText ❞",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      "- $author",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(flex: 4),
                    Column(
                      children: [
                        Icon(
                          Icons.swipe_up_alt,
                          color: Colors.white70,
                          size: 38,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Swipe up",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 26),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite_border, color: Colors.white, size: 34),
                            SizedBox(width: 35),
                            Icon(Icons.local_offer_outlined, color: Colors.white, size: 34),
                          ],
                        ),
                        SizedBox(height: 18),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}