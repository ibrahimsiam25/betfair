


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/gradient_slider.dart';
import '../data/static/situation_data.dart';

class SituationPage extends StatelessWidget {
  final int index;
  final List<int> rateOfSituation;

  const SituationPage({
    Key? key,
    required this.index,
    required this.rateOfSituation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesMethodsBack),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
        Column(
      children: [
        Text(
          "Situation ${index + 1}",
          style: AppTextStyles.fontWhiteW700.copyWith(fontSize: 24.sp),
        ),
        Text(
          situationData[index].title,
          style: AppTextStyles.fontWhiteW700.copyWith(fontSize: 24.sp),
        ),
      ],
    ),
           Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        situationData[index].description,
        textAlign: TextAlign.center,
        style: AppTextStyles.fontWhiteW500.copyWith(fontSize: 16.sp),
      ),
    ),
           SizedBox(height: 40.h),GradientSlider(
      thumbBorderColor: AppColors.yellow,
      onChanged: (value) {
        rateOfSituation[index] = value.toInt();
        print(rateOfSituation);
      },
    ),
           SizedBox(height: 40.h),
           Text(
      "Scale: 0 - ‘I remain completely calm’, 10 - ‘I panic and fear that something bad might happen’.",
      textAlign: TextAlign.center,
      style: AppTextStyles.fontWhiteW500.copyWith(
        fontSize: 11.sp,
        color: AppColors.white.withOpacity(0.7),
      ),
    )
        ],
      ),
    );
  }
}



