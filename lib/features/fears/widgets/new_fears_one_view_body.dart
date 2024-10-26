import 'package:betfair/core/routes/app_router.dart';
import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:betfair/core/widgets/show_custom_snack_bar.dart';
import 'package:betfair/features/fears/widgets/my_button.dart';
import 'package:betfair/features/fears/widgets/new_fear_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_feild.dart';

class NewFearsViewBody extends StatefulWidget {
  const NewFearsViewBody({super.key});

  @override
  State<NewFearsViewBody> createState() => _NewFearsViewBodyState();
}

class _NewFearsViewBodyState extends State<NewFearsViewBody> {
  List<double> opacities = List.filled(buttonLabels.length, 0.9);
  String textFieldValue = '';
  bool isButtonPressed = false;

  void _onButtonPressed(int index) {
    setState(() {
      isButtonPressed = true;
      opacities[index] = 1.0; // Set the pressed button opacity
      // Reset other buttons' opacity
      for (int i = 0; i < opacities.length; i++) {
        if (i != index) {
          opacities[i] = 0.7;
        }
      }
    });
  }

  void _onNextPressed() async {
    if (textFieldValue.isEmpty || !isButtonPressed) {
      showCustomSnackBar(
        context,
        "Please enter your fears and select how long it has been bothering you.",
      );
    } else {
      final int selectedDurationIndex = opacities.indexOf(1.0);
      GoRouter.of(context).push(
        AppRouter.kNewTwoFears,
        extra: {
          kFears: textFieldValue,
          kHowLong: buttonLabels[selectedDurationIndex],
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      floatingActionButton: CustomButton(
        text: "NEXT",
        onPressed: _onNextPressed,
      ),
      body: ListView(
        children: [
          Padding(
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
                        "Who or what are you afraid of?",
                        style: AppTextStyles.fontWhiteW400
                            .copyWith(fontSize: 16.sp),
                      ),
                      SizedBox(height: 3.h),
                      CustomTextField(
                        onChanged: (value) {
                          setState(() {
                            textFieldValue = value;
                          });
                        },
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "How long has it been bothering you?",
                        style: AppTextStyles.fontWhiteW400
                            .copyWith(fontSize: 16.sp),
                      ),
                      SizedBox(height: 3.h),
                      ...List.generate(buttonLabels.length, (index) {
                        return MyButton(
                          label: buttonLabels[index],
                          opacity: opacities[index],
                          onPressed: () => _onButtonPressed(index),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
