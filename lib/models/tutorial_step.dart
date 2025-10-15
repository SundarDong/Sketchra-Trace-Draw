import 'package:flutter/material.dart';

class TutorialStep {
  final int stepNumber;
  final String description;
  final String imagePath;
  final Color color;

  TutorialStep({
    required this.stepNumber,
    required this.description,
    required this.imagePath,
    required this.color,
  });
}
