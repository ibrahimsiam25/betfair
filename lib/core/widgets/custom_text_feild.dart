import 'dart:ui';
import 'package:betfair/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final Function(String) onChanged; 
  final Icon? icon; // Change to Icon type for flexibility

  const CustomTextField({
    super.key,
    required this.onChanged, 
    this.icon, // Accept an optional icon parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.darkPrimary.withOpacity(0.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkPrimary.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.2),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                suffixIcon: icon, // Place the icon here
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              cursorColor: AppColors.darkPrimary,
              onChanged: onChanged, // Use the callback here
            ),
          ),
        ),
      ),
    );
  }
}
