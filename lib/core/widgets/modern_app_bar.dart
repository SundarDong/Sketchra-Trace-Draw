import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModernAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? titleColor;
  final Color? iconColor;
  final List<Widget>? actions;
  final bool showBackButton;

  const ModernAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
    this.gradient,
    this.titleColor,
    this.iconColor,
    this.actions,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:
            gradient ??
            LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFFF69B4), // Hot pink
                const Color(0xFFFF1493), // Deep pink
                const Color(0xFFFFC0CB).withOpacity(0.8), // Light pink
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF69B4).withOpacity(0.3),
            blurRadius: 20.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.0.h),
          child: Row(
            children: [
              // Conditionally show back button
              if (showBackButton)
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8.r,
                          offset: Offset(0, 2.h),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: iconColor ?? Colors.white,
                      size: 18.sp,
                    ),
                  ),
                )
              else
                44.horizontalSpace,
              // Title
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: titleColor ?? Colors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8.sp,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 2.h),
                        blurRadius: 4.r,
                      ),
                    ],
                  ),
                ),
              ),

              // Actions or spacer
              if (actions != null && actions!.isNotEmpty)
                Row(children: actions!)
              else
                44.horizontalSpace,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
