import 'package:betfair/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_text_styles.dart';

class MyButton extends StatelessWidget {
  final String label;
  final double opacity;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.label,
    required this.opacity,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary, // Button color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
            ),

            padding: const EdgeInsets.symmetric(vertical: 15), // Padding
            minimumSize:
                const Size(double.infinity, 50), // Minimum width and height
          ),
          child: Text(
            label,
            style: AppTextStyles.fontBlackW700.copyWith(fontSize: 18.sp),
          ),
        ),
      ),
    );
  }
}
