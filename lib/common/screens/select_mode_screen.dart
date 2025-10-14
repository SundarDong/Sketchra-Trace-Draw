import 'dart:io';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Image Display
              Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: _buildImage(widget.imagePath),
                ),
              ),
              const SizedBox(height: 24),

              // Mode Selection Buttons
              Row(
                children: [
                  Expanded(
                    child: _buildModeButton('Sketch', selectedMode == 'Sketch'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildModeButton('Trace', selectedMode == 'Trace'),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Description Text
              Text(
                selectedMode == 'Sketch'
                    ? 'Draw through the phone\'s camera, with various supporting features.'
                    : 'Trace over the image to create your drawing.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Draw Now Button
              SizedBox(
                width: double.infinity,
                height: 56,
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
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Draw now',
                    style: TextStyle(
                      fontSize: 18,
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
            Icon(Icons.broken_image, color: Colors.grey.shade400, size: 40),
            const SizedBox(height: 8),
            Text(
              'Image not found',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
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
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFFFF69B4) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFFF69B4).withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            mode,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? const Color(0xFFFF69B4) : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
