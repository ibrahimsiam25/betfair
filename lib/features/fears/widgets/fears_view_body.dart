import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';

class FearsViewBody extends StatelessWidget {
  const FearsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(onPressed: (){
            GoRouter.of(context).push(AppRouter.kNewFears);
          }, icon:  SvgPicture.asset(
            width: 32.w,
                height:32.h,
                Assets.imagesAdd,
       
              )),
        )
      ]),
    );
  }
}