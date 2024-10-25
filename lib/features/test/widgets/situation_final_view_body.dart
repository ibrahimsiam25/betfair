import 'package:betfair/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';

class SituationFinalViewBody extends StatelessWidget {
  const SituationFinalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Back",
              style: AppTextStyles.fontPrimaryW500.copyWith(fontSize: 22.sp),
            ),
          ),
        ),
         Spacer(flex: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(Assets.imagesMethodsBack),
                  fit: BoxFit.fill,
                )),
                child: Column(children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    "The final part",
                    style:
                        AppTextStyles.fontWhiteW500.copyWith(fontSize: 26.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Add up the scores you gave to all the situations. High scores indicate those aspects of life that cause you the most fear or anxiety. This can be useful for self-discovery or discussion with a professional.",
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyles.fontWhiteW500.copyWith(fontSize: 16.sp),
                  ),
                     SizedBox(
                    height: 40.h,
                  ),
                ]),
              )
            ],
          ),
        ),
     const   Spacer(flex: 5,),
        CustomButton(
            fontColor: AppColors.theme, text: "MAIN", onPressed: () {
              GoRouter.of(context).push(AppRouter.kBottomNav);
            }),
       const  Spacer(flex: 1,),
      ],
    );
  }
}
