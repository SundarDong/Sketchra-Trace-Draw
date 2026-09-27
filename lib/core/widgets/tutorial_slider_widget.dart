import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketchtrace/models/tutorial_step.dart';

class TutorialSliderWidget extends StatefulWidget {
  const TutorialSliderWidget({super.key});

  @override
  State<TutorialSliderWidget> createState() => _TutorialSliderWidgetState();
}

class _TutorialSliderWidgetState extends State<TutorialSliderWidget> {
  static const _accentColor = Color(0xFF029849);

  final PageController _pageController = PageController();
  int _currentPage = 0;

  static List<TutorialStep> _steps = [
    TutorialStep(
      stepNumber: 1,
      description: 'Place a glass upside down on top of a sheet of paper.',
      imagePath: 'assets/images/guide/step1.png',
      color: _accentColor,
    ),
    TutorialStep(
      stepNumber: 2,
      description:
          'Position your phone on top of the glass — the app will project the image using your camera view.',
      imagePath: 'assets/images/guide/step2.png',
      color: _accentColor,
    ),
    TutorialStep(
      stepNumber: 3,
      description:
          'Select the image and adjust the opacity and size to align it with your paper.',
      imagePath: 'assets/images/guide/step3.png',
      color: _accentColor,
    ),
    TutorialStep(
      stepNumber: 4,
      description:
          'Trace the visible lines on your paper, then add details and shading.',
      imagePath: 'assets/images/guide/step4.png',
      color: _accentColor,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _next() {
    if (_currentPage < _steps.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == _steps.length - 1;

    return Container(
      margin: EdgeInsets.all(16.r),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 380.h,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: _steps.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final step = _steps[index];
                return Column(
                  children: [
                    Text(
                      'Step ${step.stepNumber}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: _accentColor,
                      ),
                    ),
                    12.verticalSpace,
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          step.imagePath,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    12.verticalSpace,
                    Text(
                      step.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black87,
                        height: 1.4,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          16.verticalSpace,
          // Plain dot indicators — no color per step
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_steps.length, (index) {
              final isActive = index == _currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: isActive ? 20.w : 6.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: isActive ? Colors.black87 : Colors.black26,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              );
            }),
          ),
          16.verticalSpace,
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: isLastPage ? null : _next,
              style: ElevatedButton.styleFrom(
                backgroundColor: _accentColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Text(
                isLastPage ? 'Done' : 'Next',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
