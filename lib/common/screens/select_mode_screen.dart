import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketchtrace/common/screens/sketch_screen.dart';
import 'package:sketchtrace/common/screens/trace_screen.dart';
import 'package:sketchtrace/core/widgets/modern_app_bar.dart';

class SelectModeScreen extends StatefulWidget {
  final String imagePath;

  const SelectModeScreen({super.key, required this.imagePath});

  @override
  State<SelectModeScreen> createState() => _SelectModeScreenState();
}

class _SelectModeScreenState extends State<SelectModeScreen> {
  String selectedMode = 'Sketch'; // Default selected mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const ModernAppBar(title: 'Select mode'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            children: [
              // Image Display
              Container(
                width: double.infinity,
                height: 500.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12.r,
                      offset: Offset(0, 4.h),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: _buildImage(widget.imagePath),
                ),
              ),
              24.verticalSpace,

              // Mode Selection Buttons
              Row(
                children: [
                  Expanded(
                    child: _buildModeButton('Sketch', selectedMode == 'Sketch'),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: _buildModeButton('Trace', selectedMode == 'Trace'),
                  ),
                ],
              ),
              16.verticalSpace,

              // Description Text
              Text(
                selectedMode == 'Sketch'
                    ? 'Draw through the phone\'s camera, with various supporting features.'
                    : 'Trace over the image to create your drawing.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade600,
                  height: 1.5.h,
                ),
                textAlign: TextAlign.center,
              ),
              32.verticalSpace,

              // Draw Now Button
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedMode == 'Sketch') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SketchScreen(imagePath: widget.imagePath),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TraceScreen(imagePath: widget.imagePath),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF69B4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Draw now',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds either an asset image or a file image depending on the path type
  Widget _buildImage(String imagePath) {
    if (imagePath.startsWith('assets/')) {
      return Image.asset(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _errorImage();
        },
      );
    } else {
      return Image.file(
        File(imagePath),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _errorImage();
        },
      );
    }
  }

  /// Reusable error image widget
  Widget _errorImage() {
    return Container(
      color: Colors.grey.shade100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.broken_image, color: Colors.grey.shade400, size: 40.sp),
            8.verticalSpace,
            Text(
              'Image not found',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the Sketch/Trace mode button
  Widget _buildModeButton(String mode, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMode = mode;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? const Color(0xFFFF69B4) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFFF69B4).withOpacity(0.2),
                    blurRadius: 10.r,
                    offset: Offset(0, 4.h),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            mode,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: isSelected ? const Color(0xFFFF69B4) : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
