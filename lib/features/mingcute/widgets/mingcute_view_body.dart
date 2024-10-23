import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/theme/app_colors.dart';
import 'package:betfair/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

class MingcuteViewBody extends StatefulWidget {
  final double rating;
  final int totalStars;

  const MingcuteViewBody({
    Key? key,
    this.rating = 1.3,
    this.totalStars = 5,
  }) : super(key: key);

  @override
  State<MingcuteViewBody> createState() => _MingcuteViewBodyState();
}

class _MingcuteViewBodyState extends State<MingcuteViewBody> {
  List<Widget> _buildStars() {
    int filledStars = widget.rating.floor();
    int emptyStars = max(widget.totalStars - filledStars, 0);

    return List<Widget>.generate(filledStars, (index) => _buildStar(isFilled: true))
      ..addAll(List<Widget>.generate(emptyStars, (index) => _buildStar(isFilled: false)));
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
            width: double.infinity,
            height: 75.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cognitive behavioural therapy (CBT)",
                      style: AppTextStyles.fontBlackW700.copyWith(fontSize: 14.sp),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          ..._buildStars(),
                          const SizedBox(width: 4),
                          Text(
                            "${widget.rating} (67)",
                            style: AppTextStyles.fontBlackW700.copyWith(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Image.asset(Assets.imagesBiBack)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
