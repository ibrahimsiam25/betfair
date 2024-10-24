import 'dart:math';

import 'package:betfair/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_text_styles.dart';
import '../data/model/fear_model.dart';

class FearElement extends StatelessWidget {
  final FearModel fearModel;
  const FearElement({
    super.key,
    required this.fearModel,
  });
  List<Widget> _buildStars() {
    int filledStars = fearModel.rating.floor();
    int emptyStars = max(fearModel.totalStars - filledStars, 0);

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
      padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
      margin: EdgeInsets.only(bottom: 8.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 240.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fearModel.title,
                  overflow: TextOverflow.clip,
                  style: AppTextStyles.fontBlackW700.copyWith(fontSize: 14.sp),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      ..._buildStars(),
                      const SizedBox(width: 4),
                      Text(
                        "${fearModel.rating} (${fearModel.totalRatings})",
                        style: AppTextStyles.fontBlackW700
                            .copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 40.w,
            height: 40.h,
            child: Image.asset(Assets.imagesBiBack),
          ),
        ],
      ),
    );
  }
}
