import 'dart:math';

import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/theme/app_colors.dart';
import 'package:betfair/core/theme/app_text_styles.dart';
import 'package:betfair/features/methods/data/model/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MethodsReviewsElement extends StatelessWidget {
  final ReviewModel reviewModel;
  final bool divide;
  const MethodsReviewsElement({
    super.key,
    required this.reviewModel,
    required this.divide,
  });
  List<Widget> _buildStars() {
    int filledStars = reviewModel.rate.floor();
    int emptyStars = max(5 - filledStars, 0);

    return List<Widget>.generate(
        filledStars, (index) => _buildStar(isFilled: true))
      ..addAll(List<Widget>.generate(
          emptyStars, (index) => _buildStar(isFilled: false)));
  }

  Widget _buildStar({required bool isFilled}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Image.asset(
        width: 12.w,
        height: 12.h,
        color: isFilled ? AppColors.primary : null,
        isFilled ? Assets.imagesStar : Assets.imagesStarEmpty,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Review
        Row(
          children: [
            // Avatar
            Image.asset(
              Assets.imagesReviewAvatar,
              width: 32.w,
              height: 32.w,
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and stars
                Row(
                  children: [
                    Text(
                      reviewModel.name,
                      style: AppTextStyles.fontWhiteW500.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    ..._buildStars(),
                  ],
                ),
                // Description
                Text(
                  reviewModel.description,
                  style: AppTextStyles.fontWhiteW500.copyWith(
                    fontSize: 16.sp,
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(height: 2.h),
        if (divide) const Divider(),
      ],
    );
  }
}
