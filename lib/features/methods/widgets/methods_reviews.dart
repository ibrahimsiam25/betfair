import 'dart:math';

import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/theme/app_colors.dart';
import 'package:betfair/core/theme/app_text_styles.dart';
import 'package:betfair/features/methods/data/model/review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MethodsReviews extends StatelessWidget {
  final ReviewModel reviewModel;
  const MethodsReviews({
    super.key,
    required this.reviewModel,
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
        width: 18.w,
        height: 18.h,
        isFilled ? Assets.imagesStar : Assets.imagesStarEmpty,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 24.w, right: 24.h, top: 24.h, bottom: 80.h),
      decoration: BoxDecoration(
        color: AppColors.darkPrimary.withAlpha(80),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                Assets.imagesReviewAvatar,
                width: 40.w,
                height: 40.w,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        reviewModel.name,
                        style: AppTextStyles.fontWhiteW700,
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
