import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class ThemeText {
  static const TextStyle primaryText =
      TextStyle(color: AppColors.bg, fontSize: 20, fontWeight: FontWeight.w700);

  static const TextStyle locationText =
      TextStyle(color: AppColors.black, fontSize: 14);
  static const TextStyle iconBtnText = TextStyle(
      color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle headingText =
      TextStyle(color: AppColors.bg, fontSize: 26, fontWeight: FontWeight.w700);
  static const TextStyle headingText20 =
      TextStyle(color: AppColors.bg, fontSize: 20, fontWeight: FontWeight.w700);

  static const TextStyle deadlineText =
      TextStyle(color: AppColors.bg, fontSize: 16, fontWeight: FontWeight.w600);

  static const TextStyle subtitleText = TextStyle(
      color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w500);

  static const TextStyle subtitleTextGrey = TextStyle(
      color: AppColors.grey, fontSize: 14, fontWeight: FontWeight.w500);

  static const TextStyle cardBoldText = TextStyle(
      color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w500);

  static const TextStyle appBarWhite =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.bg);
  static const TextStyle appBarBlack = TextStyle(
      fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.black);

  static const TextStyle boldText = TextStyle(
      color: AppColors.black, fontSize: 18, fontWeight: FontWeight.w500);
  static const TextStyle title = TextStyle(
      color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w600);

  static const TextStyle btnText =
      TextStyle(color: AppColors.bg, fontSize: 16, fontWeight: FontWeight.w600);

  static const TextStyle iconButton = TextStyle(
      color: AppColors.black, fontSize: 16, fontWeight: FontWeight.w500);
  static const TextStyle blacktext16 = TextStyle(
    color: AppColors.black,
    fontSize: 16,
  );

  static const TextStyle userText =
      TextStyle(color: AppColors.bg, fontSize: 19, fontWeight: FontWeight.bold);

  static const TextStyle textButton = TextStyle(
      color: AppColors.black, fontSize: 16, fontStyle: FontStyle.italic);
  static const TextStyle skipButton = TextStyle(
      color: AppColors.black, fontSize: 17, fontWeight: FontWeight.w500);

  static const TextStyle noteText = TextStyle(
      color: AppColors.black,
      fontSize: 16,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w500);

  static const TextStyle progressHeader = TextStyle(
      fontFamily: 'Montserrat',
      color: AppColors.black,
      fontSize: 40,
      height: 0.5,
      fontWeight: FontWeight.w600);
}
