import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/theme/app_colors.dart';
import 'package:betfair/features/fears/widgets/fears_element.dart';
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

