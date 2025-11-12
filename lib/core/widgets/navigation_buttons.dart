import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationButtons extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Color currentColor;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const NavigationButtons({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.currentColor,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20.w, // left
        0.h, // top
        20.w, // right
        20.h, // bottom
      ),

      child: Row(
        children: [
          if (currentPage > 0)
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onPrevious,
                icon: Icon(Icons.arrow_back, size: 18.sp),
                label: const Text('Previous'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey.shade700,
                  side: BorderSide(color: Colors.grey.shade300),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            )
          else
            const Expanded(child: SizedBox()),
          if (currentPage > 0 && currentPage < totalPages - 1)
            12.horizontalSpace,
          if (currentPage < totalPages - 1)
            Expanded(
              child: ElevatedButton.icon(
                onPressed: onNext,
                icon: Icon(Icons.arrow_forward, size: 18.sp),
                label: const Text('Next'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: currentColor,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
