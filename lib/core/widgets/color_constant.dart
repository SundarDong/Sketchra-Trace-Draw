import 'package:flutter/material.dart';

class ColorConstant {
  ColorConstant._();

  static Color get primaryColor => const Color(0xFF029849);
  static Color get primaryLightColor => const Color(0xFFE6F0FF);
  static Color get primaryDarkColor => const Color(0xFF0043CE);

  // ───────── NEUTRALS / BASICS ─────────
  static Color get white => Colors.white;
  static Color get white70 => Colors.white70;
  static Color get black => Colors.black;
  static Color get transparent => Colors.transparent;
  static Color get normalTextColor => const Color(0xFF141414);

  // ───────── STATUS COLORS ─────────
  static Color get errorRed => const Color(0xFFFF5630);
  static Color get logoutRed => const Color(0xFFDF0000);
  static Color get successGreen => const Color(0xff36B37E);
  static Color get warningToast => const Color(0xFFFFAB00);
  static Color get redMoneyColor => const Color(0xFFEF4444);
  static Color get leafGreen => const Color(0xff36B37E);
  static Color get orange => Colors.orange;
  static Color get red => Colors.red;
  static Color get amberColor => const Color(0xFFFFB800);

  // ───────── TEXT COLORS ─────────
  static Color get hintTextColor => const Color(0xFF6B7280);
  static Color get textWhite => Colors.white;
  static Color get textGrey => const Color(0xFF5C5C5C);
  static Color get textFormColor => const Color(0xFF6B7280);
  static Color get zincGrey => const Color(0xFF71717A);
  static Color get zincDarkGrey => const Color(0xFF3F3F46);

  // ───────── GREY VARIANTS ─────────
  static Color get grey => const Color(0xFF6B7280);
  static Color get greyLight => const Color(0xFF9E9E9E);
  static Color get greyShade600 => Colors.grey.shade600;
  static Color get indigo => Colors.indigo;
  static Color get blue => Colors.blue;
  static Color get blueGrey => Colors.blueGrey;

  // ───────── SURFACE / BACKGROUND ─────────
  static Color get scaffoldBackgroundColor => const Color(0xFFF1F1F1);
  static Color get surface => Colors.white;
  static Color get slayGrey => const Color(0xFFF1F5F9);
  static Color get borderColor => const Color(0xFFE5E7EB);
  static Color get buttonColor => const Color(0xFF0B69FF);
  static Color get backgroundLight => const Color(0xFFF8FAFC);
  static Color get transparentColor => Colors.transparent;
  static Color get metaBlue => const Color(0xFF1877F2);
  static Color get smartenYellow => const Color(0xFFFFEE24);
  static Color get poweredByGrey => const Color(0xFF8E8C8C);

  // ───────── SHIMMER COLORS ─────────
  static Color get shimmerBaseColor => const Color(0xFFE0E0E0);
  static Color get shimmerHighlightColor => const Color(0xFFF5F5F5);
  static Color get shimmerFillColor => const Color(0xFFE0E0E0);
  static Color get shimmerBorderColor => const Color(0xFFE5E7EB);
}
