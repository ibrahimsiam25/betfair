import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/functions/save_and_get_map_to_list_with_shared_pref.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/gradient_slider.dart';
import '../manager/fears_cubit.dart';
import 'new_fear_app_bar.dart';

class NewFearsThreeViewBody extends StatelessWidget {
  const NewFearsThreeViewBody({super.key, required this.fearsMap});
  final Map<String, dynamic> fearsMap;
  @override
  Widget build(BuildContext context) {
    int rateLevelFear = 5;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          const NewFearAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Rate your level of fear or anxiety on a scale of 0 to 10, with 0 being ‘not at all afraid’ and 10 being ‘extremely afraid’.",
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyles.fontWhiteW400.copyWith(fontSize: 12.sp),
                  ),
                ),
                SizedBox(height: 20.h),
                GradientSlider(
                  onChanged: (value) {
                    rateLevelFear = value.toInt();
                  },
                )
              ],
            ),
          ),
          const Spacer(),
          CustomButton(
            text: "SAVE",
            onPressed: () async {
              await saveMapToListInSharedPref(
                  key: kFearsListShardPref,
                  newMap: {
                    kFears: fearsMap[kFears],
                    kHowLong: fearsMap[kHowLong],
                    kDate: fearsMap[kDate],
                    kControlMethods: fearsMap[kControlMethods],
                    kRateLevelFear: rateLevelFear
                  });
              context.read<FearsCubit>().loadFears();
              GoRouter.of(context).push(AppRouter.kBottomNav);
            },
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
