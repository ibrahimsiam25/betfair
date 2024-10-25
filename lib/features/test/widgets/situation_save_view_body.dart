import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/core/routes/app_router.dart';
import 'package:betfair/core/theme/app_text_styles.dart';
import 'package:betfair/core/widgets/custom_button.dart';
import 'package:betfair/features/test/data/static/situation_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/functions/get_color_for_rate.dart';
import '../../../core/theme/app_colors.dart';

class SituationSaveViewBody extends StatelessWidget {
  const SituationSaveViewBody({super.key, required this.rateOfSituation});
  final List<int> rateOfSituation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemCount: situationData.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 26.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Situation ${index + 1}\n${situationData[index].title}",
                          style: AppTextStyles.fontWhiteW700
                              .copyWith(fontSize: 20.sp),
                        ),
                        Container(
                          width: 50.w,
                          height: 40.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Assets.imagesNumberback),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              rateOfSituation[index].toString(),
                              style: AppTextStyles.fontWhiteW700.copyWith(
                                fontSize: 22.sp,
                                color: getColorForRate(rateOfSituation[index]),
                              ),
                            ),
                          ),
                        )
                      
                      ]),
                );
              },
            ),
          ), const Spacer(flex: 2,),
            CustomButton(
              fontColor: AppColors.theme,
              text: "SAVE", onPressed: (){
                GoRouter.of(context).push(AppRouter.kSituationFinal);
              }),
               const Spacer(flex: 1,),
        ],
      ),
    );
  }
}
