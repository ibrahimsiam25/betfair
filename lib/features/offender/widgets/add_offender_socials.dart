import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/service/shared_preferences_singleton.dart';
import 'package:betfair/core/widgets/custom_button.dart';
import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:betfair/features/offender/widgets/add_offender_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';
import 'add_offender_element.dart';

class AddOffenderSocials extends StatelessWidget {
  const AddOffenderSocials({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController social1Controller = TextEditingController();
    TextEditingController social2Controller = TextEditingController();
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OffenderAppBar(),
            SizedBox(height: 8.h),
            AddOffenderElement(
              name: 'Social page 1',
              image: Assets.imagesOffenderTextfield,
              controller: social1Controller,
              onSubmitted: (value) async {
                social1Controller.text = value;
                await SharedPref.setString('social1', value);
              },
            ),
            SizedBox(height: 8.h),
            AddOffenderElement(
              name: 'Social page 2',
              image: Assets.imagesOffenderTextfield2,
              controller: social2Controller,
              onSubmitted: (value) async {
                social2Controller.text = value;
                await SharedPref.setString('social2', value);
              },
            ),
            const Spacer(),
            Align(
              child: CustomButton(
                text: "SAVE",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kViewOffenderName);
                },
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
