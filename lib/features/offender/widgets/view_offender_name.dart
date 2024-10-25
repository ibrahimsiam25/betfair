import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:betfair/features/offender/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';
import 'view_offender_element.dart';

class ViewOffenderName extends StatefulWidget {
  const ViewOffenderName({super.key});

  @override
  State<ViewOffenderName> createState() => _ViewOffenderNameState();
}

class _ViewOffenderNameState extends State<ViewOffenderName> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OffenderBackButton(),
              SizedBox(height: 12.h),
              InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kViewOffenderSocilas);
                },
                child: ViewOffenderElement(
                  title: 'Albert Flores',
                  element: Image(
                    width: 48.w,
                    image: const AssetImage(
                      Assets.imagesBiBack,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
