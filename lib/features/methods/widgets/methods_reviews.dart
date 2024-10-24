import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/theme/app_colors.dart';
import 'package:betfair/features/methods/widgets/methods_reviews_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/model/review_model.dart';

class MethodsReviews extends StatelessWidget {
  const MethodsReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 550.h,
          padding:
              EdgeInsets.only(left: 24.w, right: 24.h, top: 16.h, bottom: 16.h),
          decoration: BoxDecoration(
            color: AppColors.darkPrimary.withAlpha(80),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  ...List.generate(
                    8,
                    (index) {
                      return MethodsReviewsElement(
                        divide: index == 7 ? false : true,
                        reviewModel: ReviewModel(
                          name: 'Wade Warren',
                          description: 'Doesn\'t help at all',
                          rate: 1,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 24.h,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        Assets.imagesTextField,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, bottom: 4.h),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ),
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 12.w,
                      top: 0,
                      bottom: 0,
                      child: Image.asset(
                        width: 16.w,
                        Assets.imagesSend,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
