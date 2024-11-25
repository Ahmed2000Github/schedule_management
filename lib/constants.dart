import 'package:flutter/material.dart';

class Constants {
  static const double horizontalPadding = 27;

  static const Color primaryColor = Color(0xFFFF7648);
  static const Color secondaryColor = Color(0xFF4DC591);
  static const Color disabledTextColor = Color(0xFFBCC1CD);
  static const Color disabledIconColor = Color(0xFF88889D);
  static const Color lightPurpleColor = Color(0xFF8F98FF);
  static const Color darkBlueColor = Color(0xFF182A88);
  static const Color lightOrangeColor = Color(0xFFFFC278);
  static const Color darkGreenColor = Color(0xFF00664F);
  static const Color scaffoldBackgroundColor = Color(0xFFF6F6F5);

  static const String fontFamilly = "Poppins";

  static const TextStyle titleTextStyle = TextStyle(
      fontFamily: fontFamilly, fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle subTitleTextStyle = TextStyle(
      fontFamily: fontFamilly,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: disabledTextColor);
  static const TextStyle lessonTitleTextStyle = TextStyle(
      fontFamily: fontFamilly, fontSize: 16, fontWeight: FontWeight.w600);
  static const TextStyle lessonSubTitleTextStyle = TextStyle(
      fontFamily: fontFamilly, fontSize: 12, fontWeight: FontWeight.w500);
  static const TextStyle detailsTextStyle = TextStyle(
      fontFamily: fontFamilly, fontSize: 12, fontWeight: FontWeight.normal);
  static const TextStyle startTimeTextStyle = TextStyle(
      fontFamily: fontFamilly, fontSize: 16, fontWeight: FontWeight.w500);
  static const TextStyle endTimeTextStyle = TextStyle(
      fontFamily: fontFamilly, fontSize: 12, fontWeight: FontWeight.w500);
}
