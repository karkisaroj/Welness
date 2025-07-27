import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/app/app_routes.dart';
import 'package:welness/services/auth_service.dart';

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
    "Faith & Spirituality",
    "Positive thinking",
    "Stress & Anxiety",
  ];

  List<String> selectedTopics = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadExistingPreferences();
  }

  Future<void> _loadExistingPreferences() async {
    if (AuthService.currentAppUser != null) {
      setState(() {
        selectedTopics = List<String>.from(
          AuthService.currentAppUser!.preferences,
        );
      });
    }
  }

  Future<void> _savePreferences() async {
    final messenger = ScaffoldMessenger.of(context);
    final navigation = Navigator.of(context);

    if (selectedTopics.isEmpty) {
      messenger.showSnackBar(
        SnackBar(
          content: Text("Please select at least one topic"),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      if (AuthService.currentAppUser == null) {
        throw Exception("User not logged in");
      }

      log("Attempting to save preferences: $selectedTopics");

      bool success = await AuthService.updatePreferences(selectedTopics);

      if (success) {
        log("Preferences saved: $selectedTopics");
        messenger.showSnackBar(
          SnackBar(
            content: Text("Preferences saved successfully!"),
            backgroundColor: Colors.green,
          ),
        );
        navigation.pushNamed(AppRoutes.quote, arguments: selectedTopics);
      } else {
        throw Exception("Failed saving preferences");
      }
    } catch (e) {
      log("Error saving preferences: $e");
      messenger.showSnackBar(
        SnackBar(
          content: Text("Error saving preferences: ${e.toString()}"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 4),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

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
        title: Text("Preferences"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.w, top: 20.h), // ✅ Fixed method
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
                bool isSelected = selectedTopics.contains(topic);
                return ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () {
                          setState(() {
                            if (isSelected) {
                              selectedTopics.remove(topic);
                            } else {
                              selectedTopics.add(topic);
                            }
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected
                        ? Colors.blue
                        : const Color.fromARGB(255, 22, 18, 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.r),
                    ),
                  ),
                  child: Text(
                    topic,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white,
                      fontSize: 11.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Selected: ${selectedTopics.length} topics",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
              ),
            ),

            SizedBox(height: 30.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: _isLoading ? null : _savePreferences,
                  child: _isLoading
                      ? SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          "Save Preferences",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
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
