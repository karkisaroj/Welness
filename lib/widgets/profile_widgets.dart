import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? iconColor;

  const ProfileTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.trailing,
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
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                trailing ??
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

class SectionHeader extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? padding;

  const SectionHeader({super.key, required this.title, this.padding});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: padding ?? EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white70 : Colors.grey[600],
          letterSpacing: 1.2,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
