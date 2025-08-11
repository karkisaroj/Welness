import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;

  const CustomCard({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.onTap,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Material(
        color: backgroundColor ?? (isDark ? Color(0xFF1E1E1E) : Colors.white),
        borderRadius: borderRadius ?? BorderRadius.circular(16.r),
        elevation: elevation ?? 4,
        shadowColor: isDark ? Colors.black26 : Colors.grey.withOpacity(0.1),
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ?? BorderRadius.circular(16.r),
          child: Container(
            padding: padding ?? EdgeInsets.all(16.w),
            child: child,
          ),
        ),
      ),
    );
  }
}

class GradientCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final List<Color>? gradientColors;
  final BorderRadius? borderRadius;

  const GradientCard({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.onTap,
    this.gradientColors,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius ?? BorderRadius.circular(16.r),
        elevation: 6,
        shadowColor: isDark ? Colors.black26 : Colors.grey.withOpacity(0.15),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:
                  gradientColors ??
                  (isDark
                      ? [Color(0xFF2D2D2D), Color(0xFF1A1A1A)]
                      : [Color(0xFFF8F9FA), Color(0xFFE9ECEF)]),
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(16.r),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: borderRadius ?? BorderRadius.circular(16.r),
              child: Container(
                padding: padding ?? EdgeInsets.all(16.w),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
