import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/service/shared_preferences_singleton.dart';
import 'package:betfair/core/widgets/custom_button.dart';
import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';
import 'add_offender_appbar.dart';
import 'add_offender_element.dart';

class AddOffenderNameAndCause extends StatelessWidget {
  const AddOffenderNameAndCause({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController causeController = TextEditingController();
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OffenderAppBar(),
            SizedBox(height: 8.h),
            AddOffenderElement(
              name: 'Name of the offender',
              image: Assets.imagesOffenderTextfield,
              controller: nameController,
              onSubmitted: (value) async {
                nameController.text = value;
                await SharedPref.setString('offenderName', value);
              },
            ),
            SizedBox(height: 8.h),
            AddOffenderElement(
              name: 'Cause of the conflict',
              image: Assets.imagesOffenderTextfield2,
              controller: causeController,
              onSubmitted: (value) async {
                causeController.text = value;
                await SharedPref.setString('offenderCause', value);
              },
            ),
            const Spacer(),
            Align(
              child: CustomButton(
                text: "NEXT",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kOffenderSocilas);
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
