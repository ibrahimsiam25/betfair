import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/widgets/custom_button.dart';
import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';
import 'add_offender_appbar.dart';
import 'add_offender_element.dart';

class AddOffenderNameAndCause extends StatefulWidget {
  const AddOffenderNameAndCause({super.key});

  @override
  State<AddOffenderNameAndCause> createState() =>
      _AddOffenderNameAndCauseState();
}

class _AddOffenderNameAndCauseState extends State<AddOffenderNameAndCause> {
  TextEditingController nameController = TextEditingController();
  TextEditingController causeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            ),
            SizedBox(height: 8.h),
            AddOffenderElement(
              name: 'Cause of the conflict',
              image: Assets.imagesOffenderTextfield2,
              controller: causeController,
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
