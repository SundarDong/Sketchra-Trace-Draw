import 'package:flutter/material.dart';

class SketchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? titleColor;

  const SketchAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.actions,
    this.backgroundColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black87,
                  size: 20,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? const Color(0xFFFF69B4),
          fontSize: 26,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
      centerTitle: true,
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.grey.shade200,
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
