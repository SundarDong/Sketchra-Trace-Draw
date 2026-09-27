import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketchtrace/core/widgets/color_constant.dart';

class StylesConstants {
  StylesConstants._();

  static const double textScaleFactor = 1.1;

  static TextStyle get normal24w700 => _normal(24.sp, FontWeight.w700);
  static TextStyle get normal24w600 => _normal(24.sp, FontWeight.w600);
  static TextStyle get normal20w700 => _normal(20.sp, FontWeight.w700);
  static TextStyle get normal20w600 => _normal(20.sp, FontWeight.w600);
  static TextStyle get normal20w500 => _normal(20.sp, FontWeight.w500);
  static TextStyle get normal18w700 => _normal(18.sp, FontWeight.w700);
  static TextStyle get normal18w600 => _normal(18.sp, FontWeight.w600);
  static TextStyle get normal16w700 => _normal(16.sp, FontWeight.w700);
  static TextStyle get normal16w600 => _normal(16.sp, FontWeight.w600);
  static TextStyle get normal15w700 => _normal(15.sp, FontWeight.w700);
  static TextStyle get normal15w600 => _normal(15.sp, FontWeight.w600);
  static TextStyle get normal16w500 => _normal(16.sp, FontWeight.w500);
  static TextStyle get normal16w400 => _normal(16.sp, FontWeight.w400);
  static TextStyle get normal14w700 => _normal(14.sp, FontWeight.w700);
  static TextStyle get normal14w600 => _normal(14.sp, FontWeight.w600);
  static TextStyle get normal14w500 => _normal(14.sp, FontWeight.w500);
  static TextStyle get normal14w400 => _normal(14.sp, FontWeight.w400);
  static TextStyle get normal13w400 => _normal(13.sp, FontWeight.w400);
  static TextStyle get normal12w600 => _normal(12.sp, FontWeight.w600);
  static TextStyle get normal12w500 => _normal(12.sp, FontWeight.w500);
  static TextStyle get normal12w400 => _normal(12.sp, FontWeight.w400);
  static TextStyle get normal10w600 => _normal(10.sp, FontWeight.w600);
  static TextStyle get normal10w500 => _normal(10.sp, FontWeight.w500);
  static TextStyle get normal10w400 => _normal(10.sp, FontWeight.w400);

  static TextStyle get selectedTabLabelStyle => _normal(16.sp, FontWeight.w600);
  static TextStyle get unselectedTabLabelStyle =>
      _greyLight(16.sp, FontWeight.normal);

  static TextStyle get fontRed14w500 => TextStyle(
    fontSize: 14.sp * textScaleFactor,
    fontWeight: FontWeight.w500,
    color: ColorConstant.red,
  );
  static TextStyle get fontRed12w500 => _fontRed(12.sp, FontWeight.w500);

  // Greys
  static TextStyle get grey20w700 => _greyText(20.sp, FontWeight.w700);
  static TextStyle get grey18w500 => _greyText(18.sp, FontWeight.w500);
  static TextStyle get grey16w500 => _greyText(16.sp, FontWeight.w500);
  static TextStyle get grey14w400 => _greyText(14.sp, FontWeight.w400);
  static TextStyle get grey13w400 => _greyText(13.sp, FontWeight.w400);
  static TextStyle get grey12w400 => _greyText(12.sp, FontWeight.w400);
  static TextStyle get grey12w500 => _greyText(12.sp, FontWeight.w500);
  static TextStyle get grey11w400 => _greyText(11.sp, FontWeight.w400);

  static TextStyle get grey600_12w400 => TextStyle(
    fontSize: 12.sp * textScaleFactor,
    fontWeight: FontWeight.w400,
    color: ColorConstant.textGrey,
  );
  static TextStyle get grey700_11w400 => TextStyle(
    fontSize: 11.sp * textScaleFactor,
    fontWeight: FontWeight.w400,
    color: ColorConstant.textGrey,
  );
  static TextStyle get grey800_10w400 => TextStyle(
    fontSize: 10.sp * textScaleFactor,
    fontWeight: FontWeight.w400,
    color: ColorConstant.textGrey,
  );

  // Primary
  static TextStyle get primary14w600 => _fontPrimary(14.sp, FontWeight.w600);
  static TextStyle get primary14w400 => _fontPrimary(14.sp, FontWeight.w400);
  static TextStyle get primary16w700 => _fontPrimary(16.sp, FontWeight.w700);
  static TextStyle get primary16w400 => _fontPrimary(16.sp, FontWeight.w400);
  static TextStyle get primary10w600 => _fontPrimary(10.sp, FontWeight.w600);
  static TextStyle get primary14w500 => _fontPrimary(14.sp, FontWeight.w500);
  static TextStyle get primary12w500 => _fontPrimary(12.sp, FontWeight.w500);
  static TextStyle get primary12w600 => _fontPrimary(12.sp, FontWeight.w600);
  static TextStyle get primary16w600 => _fontPrimary(16.sp, FontWeight.w600);
  static TextStyle get primary13w600 => _fontPrimary(13.sp, FontWeight.w600);
  static TextStyle get primary13w500 => _fontPrimary(13.sp, FontWeight.w500);
  static TextStyle get primary24w700 => _fontPrimary(24.sp, FontWeight.w700);

  // Hint
  static TextStyle get hintGrey14w400 => TextStyle(
    fontSize: 14.sp * textScaleFactor,
    fontWeight: FontWeight.w400,
    color: ColorConstant.textFormColor,
  );

  static TextStyle get textFieldIconColor14w400 => TextStyle(
    fontSize: 14.sp * textScaleFactor,
    fontWeight: FontWeight.w400,
    color: ColorConstant.textGrey,
  );

  // Red
  static TextStyle get fontRed12w400 => _fontRed(12.sp, FontWeight.w400);
  static TextStyle get fontRed13w500 => _fontRed(13.sp, FontWeight.w500);

  // Accents
  static TextStyle get orange11w500 => TextStyle(
    fontSize: 11.sp * textScaleFactor,
    fontWeight: FontWeight.w500,
    color: ColorConstant.orange,
  );
  static TextStyle get green11w500 => TextStyle(
    fontSize: 11.sp * textScaleFactor,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF00A000),
  );
  static TextStyle get blue12w500 => TextStyle(
    fontSize: 12.sp * textScaleFactor,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF1E88E5),
  );

  // Private helper methods
  static TextStyle _normal(double size, FontWeight weight) {
    return TextStyle(
      fontSize: size * textScaleFactor,
      fontWeight: weight,
      color: ColorConstant.normalTextColor,
    );
  }

  static TextStyle _greyText(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize * textScaleFactor,
      fontWeight: fontWeight,
      color: ColorConstant.textGrey,
    );
  }

  static TextStyle _greyLight(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize * textScaleFactor,
      fontWeight: fontWeight,
      color: ColorConstant.greyLight,
    );
  }

  static TextStyle _fontRed(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize * textScaleFactor,
      fontWeight: fontWeight,
      color: ColorConstant.errorRed,
    );
  }

  static TextStyle _fontPrimary(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize * textScaleFactor,
      fontWeight: fontWeight,
      color: ColorConstant.primaryColor,
    );
  }

  //**************** Main Color *******************/

  static TextStyle get mainBoldRegular13 => TextStyle(
    color: ColorConstant.primaryColor,
    fontSize: 13.5.sp,
    letterSpacing: 0.4.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get mainBoldRegular14 => TextStyle(
    color: ColorConstant.primaryColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get mainBoldRegular15 => TextStyle(
    color: ColorConstant.primaryColor,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get main600Regular13 => TextStyle(
    color: ColorConstant.primaryColor,
    letterSpacing: 0.sp,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get main700Regular12 => TextStyle(
    color: ColorConstant.primaryColor,
    letterSpacing: 0.sp,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get main700Regular13 => TextStyle(
    color: ColorConstant.primaryColor,
    letterSpacing: 0.sp,
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get main700Regular14 => TextStyle(
    color: ColorConstant.primaryColor,
    letterSpacing: 0.sp,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle get main800Regular18 => TextStyle(
    color: ColorConstant.primaryColor,
    letterSpacing: 0.sp,
    fontSize: 18.sp,
    fontWeight: FontWeight.w800,
  );
  static TextStyle get main800Regular24 => TextStyle(
    color: ColorConstant.primaryColor,
    letterSpacing: -0.5.sp,
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
  );
  static TextStyle get main800Regular26 => TextStyle(
    color: ColorConstant.primaryColor,
    letterSpacing: -0.5.sp,
    fontSize: 26.sp,
    fontWeight: FontWeight.w800,
  );

  //************* White Colour ******************/

  static TextStyle get whiteBoldRegular22 => TextStyle(
    color: ColorConstant.white,
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle get white600Regular11 => TextStyle(
    color: ColorConstant.white,
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get white600Regular13 => TextStyle(
    color: ColorConstant.white,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get white600Regular14 => TextStyle(
    color: ColorConstant.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get white800Regular22 => TextStyle(
    color: ColorConstant.white,
    fontSize: 22.sp,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5.sp,
  );

  static TextStyle get whiteBoldRegular10 => TextStyle(
    color: Colors.white,
    fontSize: 10.sp,
    fontWeight: FontWeight.bold,
  );

  //************* Hint Colour ******************/
  static TextStyle get hintText400Regular10 => TextStyle(
    color: ColorConstant.hintTextColor,
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get hintText400Regular11 => TextStyle(
    color: ColorConstant.hintTextColor,
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get hintText500Regular11 => TextStyle(
    color: ColorConstant.hintTextColor,
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get hintText500Regular12 => TextStyle(
    color: ColorConstant.hintTextColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get hintText700Regular12 => TextStyle(
    color: ColorConstant.hintTextColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get hintText500Regular13 => TextStyle(
    color: ColorConstant.hintTextColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get hintText600Regular13 => TextStyle(
    color: ColorConstant.hintTextColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get hintText600Regular14 => TextStyle(
    color: ColorConstant.hintTextColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  //************* Zinc Dark Grey Colour **********/
  static TextStyle get zincGrey500Regular13 => TextStyle(
    color: ColorConstant.zincGrey,
    letterSpacing: 0.sp,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get zincGrey500Regular14 => TextStyle(
    color: ColorConstant.zincGrey,
    letterSpacing: 0.sp,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle get zincDarkGrey500Regular13 => TextStyle(
    color: ColorConstant.zincDarkGrey,
    letterSpacing: 0.sp,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );

  //************************ Normal Text Colour */

  static TextStyle get normalTextColor600Regular11 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get normalTextColor500Regular10 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5.sp,
  );

  static TextStyle get normalTextColor500Regular12 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5.sp,
  );

  static TextStyle get normalTextColor500Regular13 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get normalTextColor600Regular13 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get normalTextColor500Regular14 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get normalTextColor600Regular14 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle get normalTextColor600Regular16 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get normalTextColor600Regular17 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get normalTextColor700Regular14 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get normalTextColor700Regular16 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get normalTextColor700Regular18 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3.sp,
  );

  static TextStyle get normalTextColor700Regular22 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get normalTextColorBoldRegular18 => TextStyle(
    color: ColorConstant.normalTextColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );

  //**************************** Error Red *********************/
  static TextStyle get errorRed500Regular14 => TextStyle(
    color: ColorConstant.errorRed,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  //********************Grey Shade ****************/
  static TextStyle get greyShade600Regular13 => TextStyle(
    color: ColorConstant.greyShade600,
    fontSize: 13.sp,
    height: 1.4.h,
  );

  //****************** Text Grey ********************/
  static TextStyle get textGrey500Regular11 => TextStyle(
    color: ColorConstant.textGrey,
    fontWeight: FontWeight.w500,
    fontSize: 11.sp,
  );

  static TextStyle get textGreyBoldRegular12 => TextStyle(
    color: ColorConstant.textGrey,
    fontWeight: FontWeight.bold,
    fontSize: 12.sp,
    letterSpacing: 0.8.sp,
  );

  static TextStyle get textGrey500Regular12 => TextStyle(
    color: ColorConstant.textGrey,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );

  //********************** Succes Green ********************/
  static TextStyle get successGreen700Regular11 => TextStyle(
    color: ColorConstant.successGreen,
    fontWeight: FontWeight.w700,
    fontSize: 11.sp,
  );

  static TextStyle get successGreen500Regular12 => TextStyle(
    color: ColorConstant.successGreen,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle get successGreen600Regular12 => TextStyle(
    color: ColorConstant.successGreen,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

  //***************************** BLack *******************/
  static TextStyle get black800Regular16 => TextStyle(
    color: ColorConstant.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w800,
  );

  static TextStyle get black800Regular14 => TextStyle(
    color: ColorConstant.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.w800,
  );
}
