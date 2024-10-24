import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/functions/save_and_get_map_to_list_with_shared_pref.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/theme/app_text_styles.dart';

class FearsViewBody extends StatefulWidget {
  const FearsViewBody({super.key});

  @override
  State<FearsViewBody> createState() => _FearsViewBodyState();
}

class _FearsViewBodyState extends State<FearsViewBody> {
  List<Map<String, dynamic>> listOfMaps = [];
  @override
  void initState() {
    super.initState();
    _loadListOfMaps();
  }

  Future<void> _loadListOfMaps() async {
    listOfMaps = await getListOfMapsFromSharedPref(kFearsListShardPref);
    setState(() {}); // Update the UI after data is loaded
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(onPressed: (){
            GoRouter.of(context).push(AppRouter.kNewOneFears);
          }, icon:  SvgPicture.asset(
            width: 32.w,
                height:32.h,
                Assets.imagesAdd,
       
              )),
        ),
        SizedBox(height: 10.h,),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: listOfMaps.length,
            itemBuilder: (context, index) {
              return FearsElement(
              fear: listOfMaps[index][kFears],
              rate: listOfMaps[index][kRateLevelFear],
              );
            },
          ),
        ),

                
      ]),
    );
  }
}

class FearsElement extends StatelessWidget {
  const FearsElement({super.key, required this.rate, required this.fear});
final int rate;
final String fear;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10.r),
      ) ,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(fear, style: AppTextStyles.fontBlackW400.copyWith(fontSize: 22.sp),),
            SizedBox(height: 10.h,),
            ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ) ,
            child: 
            Text("Defeated", style: AppTextStyles.fontBlackW700.copyWith(fontSize: 18.sp,color: AppColors.green),),
            )
          ],),
         const Spacer(),
          Text("$rate", style: AppTextStyles.fontBlackW700.copyWith(fontSize: 24.sp,color: AppColors.green),),
          SvgPicture.asset(
            width: 8.w,
            height: 8.h,
            Assets.imagesDown)
        ],
      ),
    );
  }
}