import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String imagePath;

  const MenuButton({super.key, this.onTap, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
          color: Colors.white, // simple background
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
