import 'package:betfair/core/widgets/custom_button.dart';
import 'package:betfair/features/home/widgets/custom_avatar.dart';
import 'package:betfair/features/home/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_text_styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              image: const AssetImage(Assets.imagesYellowBackground),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0, // Ensure the Column stretches to fill available width
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HomeAppBar(),
                  Text(
                    "Progress of Courage",
                    style:
                        AppTextStyles.fontWhiteW700.copyWith(fontSize: 24.sp),
                  ),
                  Text(
                    "Fear level 4.1",
                    style: AppTextStyles.fontWhiteW700.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  const CustomAvatar(),
                  Text(
                    "Cameron\nWilliamson",
                    style:
                        AppTextStyles.fontWhiteW700.copyWith(fontSize: 24.sp),
                    textAlign: TextAlign.center,
                  ),
                  CustomButton(
                    text: "Add fear",
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kNewOneFears);
                    },
                  ),
                  CustomButton(
                    text: "Add offender",
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
