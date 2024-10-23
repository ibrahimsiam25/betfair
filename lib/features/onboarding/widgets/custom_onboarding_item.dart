import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_text_styles.dart';
import '../data/model/on_boarding_model.dart';

class CustomOnboardingItem extends StatelessWidget {
  const CustomOnboardingItem({super.key, required this.index});
final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       const Spacer(flex: 4),
        SizedBox(
          width: MediaQuery.of(context).size.width - 28 * 2,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(onBoardingData[index].picture),
          ),
        ),
        const Spacer(flex: 2),
        Text(
          onBoardingData[index].title,
          style: AppTextStyles.fontPrimaryW700.copyWith(fontSize: 24.sp),
          textAlign: TextAlign.center,
        ),
      const  Spacer(flex: 2),
      ],
    );
  }
}