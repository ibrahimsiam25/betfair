import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/features/fears/widgets/fears_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/routes/app_router.dart';
import '../manager/fears_cubit.dart';

class FearsViewBody extends StatelessWidget {
  const FearsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kNewOneFears);
                  },
                  icon: SvgPicture.asset(
                    width: 32.w,
                    height: 32.h,
                    Assets.imagesAdd,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              BlocBuilder<FearsCubit, List<Map<String, dynamic>>>(
                builder: (context, listOfMaps) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: listOfMaps.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kEditFear);
                        },
                        child: FearsElement(
                          fear: listOfMaps[index][kFears],
                          rate: listOfMaps[index][kRateLevelFear],
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
