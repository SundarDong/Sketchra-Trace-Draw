import 'package:flutter/material.dart';

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
            width: 60,
            height: 60,
            alignment: Alignment.center,
            child: Image.asset(
              imagePath,
              width: 40, // Fixed width for uniformity
              height: 40, // Fixed height for uniformity
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
