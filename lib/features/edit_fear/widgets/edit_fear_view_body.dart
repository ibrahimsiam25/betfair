import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/models/fears_model.dart';
import 'package:betfair/core/theme/app_colors.dart';
import 'package:betfair/core/theme/app_text_styles.dart';
import 'package:betfair/features/offender/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditFearViewBody extends StatelessWidget {
  const EditFearViewBody({super.key, required this.fearModel});
  final FearModel fearModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.imagesEditFearBack,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const OffenderBackButton(),
                      const Spacer(),
                      Text(
                        fearModel.rateLevelFear.toString(),
                        style: AppTextStyles.fontWhiteW700.copyWith(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primary,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    fearModel.fears,
                    style:
                        AppTextStyles.fontWhiteW700.copyWith(fontSize: 24.sp),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Has been bothering me for ${fearModel.howLong} ',
                    style:
                        AppTextStyles.fontWhiteW500.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Start date of the fight ${fearModel.date} ',
                    style:
                        AppTextStyles.fontWhiteW500.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                    child: const Divider(),
                  ),
                  SizedBox(height: 4.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 16.w, top: 8.h, bottom: 8.h, right: 16.w),
                      margin: EdgeInsets.only(bottom: 8.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.primary,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Presenting a report to colleagues',
                            style: AppTextStyles.fontBlackW400.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '-1',
                            style: AppTextStyles.fontBlackW700.copyWith(
                              fontSize: 20.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Container(
                              height: 260.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24.0.w, vertical: 16.0.h),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r),
                                ),
                              ),
                              child: Align(
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0.w),
                                      child: Text(
                                        'The method of struggle',
                                        style: AppTextStyles.fontBlackW700
                                            .copyWith(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Container(
                                      height: 48.h,
                                      padding: EdgeInsets.all(8.w),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            Assets.imagesStrugleTextField,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12.h),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0.w),
                                      child: Text(
                                        'What was the impact?',
                                        style: AppTextStyles.fontBlackW700
                                            .copyWith(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          Assets.imagesNega,
                                          height: 32.h,
                                          fit: BoxFit.fill,
                                        ),
                                        SizedBox(width: 8.w),
                                        Expanded(
                                          child: Container(
                                            height: 48.h,
                                            padding: EdgeInsets.all(8.w),
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  Assets.imagesImpactTextfield,
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                              style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Image.asset(
                                          Assets.imagesPosa,
                                          height: 32.h,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.h),
                                    Align(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 48.0.w,
                                              vertical: 4.h),
                                          backgroundColor: AppColors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.r),
                                          ),
                                        ),
                                        child: Text(
                                          'SAVE',
                                          style: AppTextStyles.fontWhiteW700
                                              .copyWith(fontSize: 28.sp),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      width: 48.w,
                      height: 48.w,
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            Assets.imagesCircleAdd,
                            width: 48.0.w,
                          ),
                          Center(
                            child: SvgPicture.asset(
                              Assets.imagesCircleAddSign,
                              width: 24.0.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
