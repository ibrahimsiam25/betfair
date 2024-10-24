import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed, // Added here
  });

  final String text;
  final Function()? onPressed; // Corrected declaration

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Use onPressed here
      child: SizedBox(
        width: 220.w,
        height: 70.h,
        child: Stack(
          alignment: Alignment.center, // Center the text over the image
          children: [
            Image.asset(
              Assets.imagesButton,
              fit: BoxFit.cover,
            ),
            Text(
              text,
              style: AppTextStyles.fontBlackW700.copyWith(fontSize: 24.sp),
            ),
          ],
        ),
      ),
    );
  }
}
