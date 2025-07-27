import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/app/app_routes.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool? value = false;
  bool? value2 = false;
  bool _isLoading = false;

  final TextEditingController _categoryController = TextEditingController();

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.dashboard);
          },
          icon: Icon(Icons.arrow_back, size: 25.h),
        ),
        title: Text("Add Category", style: TextStyle(fontSize: 20.h)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(18.w, 40.h, 18.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Category Name",
                    style: TextStyle(
                      fontSize: 15.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
                    controller: _categoryController,
                    enabled: !_isLoading,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 18.h,
                        horizontal: 12.w,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      hintText: "Enter category name",
                      hintStyle: TextStyle(
                        fontSize: 16.h,
                        fontFamily: "Poppins",
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Category Types Section
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Category Types:",
                    style: TextStyle(
                      fontSize: 15.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: value!
                                ? Colors.blue
                                : Colors.grey.shade800,
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            elevation: 2,
                          ),
                          onPressed: _isLoading
                              ? null
                              : () {
                                  setState(() {
                                    value = !value!;
                                  });
                                },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: value!
                                      ? Colors.white
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: value!
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.blue,
                                        size: 14.h,
                                      )
                                    : null,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                "Quotes",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 15.w),

                      // Health Button
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: value2!
                                ? Colors.green
                                : Colors.grey.shade800,
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            elevation: 2,
                          ),
                          onPressed: _isLoading
                              ? null
                              : () {
                                  setState(() {
                                    value2 = !value2!;
                                  });
                                },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: value2!
                                      ? Colors.white
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: value2!
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 14.h,
                                      )
                                    : null,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                "Health",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                children: [
                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        elevation: 3,
                      ),
                      onPressed: _isLoading
                          ? null
                          : () {
                              setState(() {
                                _isLoading = true;
                              });

                              // Simulate loading
                              Future.delayed(Duration(seconds: 2), () {
                                if (mounted) {
                                  setState(() {
                                    _isLoading = false;
                                  });

                                  // Show success message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Category saved successfully!",
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                              });
                            },
                      child: _isLoading
                          ? SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.save,
                                  color: Colors.white,
                                  size: 20.h,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "Save Category",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.h,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),

                  SizedBox(height: 15.h),
                ],
              ),
            ),

            // Bottom spacing
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
