import 'app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle fontPrimaryW700 = const TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
  static TextStyle fontPrimaryW500 = const TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
  static TextStyle fontBlackW700 = const TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
  static TextStyle fontWhiteW700 = const TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
    static TextStyle fontWhiteW400 = const TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
}
