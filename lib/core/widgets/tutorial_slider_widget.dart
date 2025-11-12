import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketchtrace/core/widgets/navigation_buttons.dart';
import 'package:sketchtrace/core/widgets/page_indicators.dart';
import 'package:sketchtrace/core/widgets/tutorial_page.dart';
import 'package:sketchtrace/models/tutorial_step.dart';

class TutorialSliderWidget extends StatefulWidget {
  const TutorialSliderWidget({super.key});

  @override
  State<TutorialSliderWidget> createState() => _TutorialSliderWidgetState();
}

class _TutorialSliderWidgetState extends State<TutorialSliderWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<TutorialStep> _steps = [
    TutorialStep(
      stepNumber: 1,
      description: 'Place a glass upside down on top of a sheet of paper.',
      imagePath: 'assets/images/guide/step1.png',
      color: const Color(0xFF6366F1),
    ),
    TutorialStep(
      stepNumber: 2,
      description:
          'Position your phone on top of the glass— the Sketchra app will project the image using your camera view.',
      imagePath: 'assets/images/guide/step2.png',
      color: const Color(0xFF10B981),
    ),
    TutorialStep(
      stepNumber: 3,
      description:
          'Select the image and adjust the opacity and size to align the virtual image perfectly with your paper.',
      imagePath: 'assets/images/guide/step3.png',
      color: const Color(0xFFF59E0B),
    ),
    TutorialStep(
      stepNumber: 4,
      description:
          'Trace the visible lines on your paper while looking through your phone screen. Once finished, add details and shading to complete your sketch.',
      imagePath: 'assets/images/guide/step4.png',
      color: const Color(0xFFEC4899),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double pageHeight = MediaQuery.of(context).size.height * 0.55;
    // 55% of screen height — adjust as needed

    return Container(
      margin: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: pageHeight,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: _steps.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  TutorialPage(step: _steps[index]),
            ),
          ),
          10.verticalSpace,
          PageIndicators(currentPage: _currentPage, steps: _steps),
          NavigationButtons(
            currentPage: _currentPage,
            totalPages: _steps.length,
            currentColor: _steps[_currentPage].color,
            onPrevious: () => _animateToPage(_currentPage - 1),
            onNext: () => _animateToPage(_currentPage + 1),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
