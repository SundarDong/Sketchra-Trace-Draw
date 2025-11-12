import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final String url;
  final Future<void> Function(String) onTap;

  const SocialButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.url,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(url),
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            alignment: Alignment.center,
            child: Image.asset(
              imagePath,
              width: 40.w,
              height: 40.h,
              fit: BoxFit.contain,
            ),
          ),
          8.verticalSpace,
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
