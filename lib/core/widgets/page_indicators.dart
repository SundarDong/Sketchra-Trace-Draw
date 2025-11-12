import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketchtrace/models/tutorial_step.dart';

class PageIndicators extends StatelessWidget {
  final int currentPage;
  final List<TutorialStep> steps;

  const PageIndicators({
    super.key,
    required this.currentPage,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          steps.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            height: 6.h,
            width: currentPage == index ? 28 : 6,
            decoration: BoxDecoration(
              color: currentPage == index
                  ? steps[index].color
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
        ),
      ),
    );
  }
}
