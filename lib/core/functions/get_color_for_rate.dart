
import 'package:betfair/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

Color getColorForRate(int number) {
  if (number >= 0 && number <= 3) {
    return AppColors.green  ; 
  } else if (number >= 4 && number <= 7) {
    return AppColors.yellow; 
  } else if (number >= 8 && number <= 10) {
    return AppColors.red; 
  } else {
    return Colors.black; 
  }
}