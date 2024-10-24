import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/features/fears/widgets/new_fear_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_feild.dart';
import '../../../core/widgets/show_custom_snack_bar.dart';

class NewFearsTwoViewBody extends StatefulWidget {
  const NewFearsTwoViewBody(
      {super.key, required this.fears, required this.howLong});
  final String fears;
  final String howLong;

  @override
  State<NewFearsTwoViewBody> createState() => _NewFearsTwoViewBodyState();
}

class _NewFearsTwoViewBodyState extends State<NewFearsTwoViewBody> {
  String textFieldValueOne = '';
  String textFieldValueTwo = '';
  void _onNextPressed() async {
    if (textFieldValueOne.isEmpty || textFieldValueTwo.isEmpty) {
      showCustomSnackBar(
        context,
        "Please enter all fields",
      );
    } else {
      GoRouter.of(context).push(
        AppRouter.kNewThreeFears,
        extra: {
          kFears: widget.fears,
          kHowLong: widget.howLong,
          kDate: textFieldValueOne,
          kControlMethods: textFieldValueTwo,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                Text(
                  "Date of the start of the fight",
                  style: AppTextStyles.fontWhiteW400.copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  icon: SvgPicture.asset(
                    Assets.imagesCalendar,
                    width: 20,
                    height: 20,
                  ),
                  onChanged: (value) {
                    setState(() {
                      textFieldValueOne = value;
                    });
                  },
                ),
                SizedBox(height: 15.h),
                 Text(
                  "What control methods were used",
                  style: AppTextStyles.fontWhiteW400.copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: 3.h),
                CustomTextField(

                  onChanged: (value) {
                    setState(() {
                      textFieldValueTwo = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomButton(
            text: "NEXT",
            onPressed: _onNextPressed,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
