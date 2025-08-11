import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Size? size;
  final BorderRadius? borderRadius;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.size,
    this.borderRadius,
    this.isLoading = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: size?.width ?? double.infinity,
      height: size?.height ?? 50.h,
      margin: padding,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor ??
              (isDark ? Color(0xFF2D2D2D) : Color(0xFF6C63FF)),
          foregroundColor: textColor ?? Colors.white,
          elevation: 3,
          shadowColor: isDark ? Colors.black26 : Colors.grey.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12.r),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 20.h,
                width: 20.w,
                child: CircularProgressIndicator(
                  color: textColor ?? Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20.h),
                    SizedBox(width: 8.w),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? iconColor;

  const CategoryButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      child: Material(
        color: isDark ? Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        elevation: 2,
        shadowColor: isDark ? Colors.black26 : Colors.grey.withOpacity(0.1),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: (iconColor ?? Color(0xFF6C63FF)).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor ?? Color(0xFF6C63FF),
                    size: 20.h,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white : Colors.black87,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.h,
                  color: isDark ? Colors.white54 : Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
