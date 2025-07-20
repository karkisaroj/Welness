import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/app/app_routes.dart';

class Preference extends StatefulWidget {
  const Preference({super.key});

  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  final List<String> topics = [
    "Hard times",
    "Working out",
    "Productivity",
    "Self-esteem",
    "Achieving goals",
    "Inspiration",
    "Letting go",
    "Love",
    "Relationships",
    "Faith & Spirtuality",
    "Positive thinking",
    "Stress & Anxiety",
  ];
  final List<String> selectedTopics = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.login);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.directional(start: 20.w, top: 30.h),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "Select all the topics that \nmotivates you",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 2.8,
            shrinkWrap: true,
            padding: EdgeInsets.all(20),
            physics: NeverScrollableScrollPhysics(),
            children: topics.map((topic) {
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (selectedTopics.contains(topic)) {
                      selectedTopics.remove(topic);
                    } else {
                      selectedTopics.add(topic);
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedTopics.contains(topic)
                      ? Colors.white
                      : const Color.fromARGB(255, 22, 18, 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(9.r),
                  ),
                ),
                child: Text(
                  topic,
                  style: TextStyle(
                    color: selectedTopics.contains(topic)
                        ? Colors.black
                        : Colors.white,
                    fontSize: 11.h,
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 100),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(360, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10.r),
              ),
            ),
            onPressed: () {
              log(selectedTopics.toString(), name: "topics");
              Navigator.pushNamed(
                context,
                AppRoutes.quote,
                arguments: selectedTopics,
              );
            },
            child: Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
