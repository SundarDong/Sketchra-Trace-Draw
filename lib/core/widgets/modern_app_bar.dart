import 'package:flutter/material.dart';

class ModernAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? titleColor;
  final Color? iconColor;
  final List<Widget>? actions;
  final bool showBackButton; // ✅ new

  const ModernAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
    this.gradient,
    this.titleColor,
    this.iconColor,
    this.actions,
    this.showBackButton = true, // ✅ default true for other screens
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:
            gradient ??
            LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFFF69B4), // Hot pink
                const Color(0xFFFF1493), // Deep pink
                const Color(0xFFFFC0CB).withOpacity(0.8), // Light pink
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF69B4).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              // ✅ Conditionally show back button
              if (showBackButton)
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: iconColor ?? Colors.white,
                      size: 18,
                    ),
                  ),
                )
              else
                const SizedBox(width: 44), // Keep title centered
              // Title
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: titleColor ?? Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),

              // Actions or spacer
              if (actions != null && actions!.isNotEmpty)
                Row(children: actions!)
              else
                const SizedBox(width: 44),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
