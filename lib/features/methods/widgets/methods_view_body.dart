import 'package:betfair/features/methods/widgets/method_element.dart';
import 'package:betfair/features/methods/widgets/methods_element_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_button.dart';
import '../data/model/review_model.dart';
import '../data/static/method_static_data.dart';
import 'methods_reviews.dart';

class MethodsViewBody extends StatefulWidget {
  const MethodsViewBody({
    super.key,
  });

  @override
  State<MethodsViewBody> createState() => _MethodsViewBodyState();
}

class _MethodsViewBodyState extends State<MethodsViewBody> {
  int fearState = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.h, top: 16.h),
        child: fearState == 0
            ? Column(
                children: [
                  ...List.generate(
                    6,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            fearState = 1;
                            this.index = index;
                          });
                        },
                        child: MethodElement(
                          methodModel: fearStaticData[index],
                        ),
                      );
                    },
                  )
                ],
              )
            : fearState == 1
                ? Column(
                    children: [
                      MethodsElementDetails(
                        methodModel: fearStaticData[index],
                      ),
                      SizedBox(height: 16.h),
                      CustomButton(
                        text: 'REVIEWS',
                        onPressed: () {
                          setState(() {
                            fearState = 2;
                          });
                        },
                      ),
                    ],
                  )
                : MethodsReviews(
                    reviewModel: ReviewModel(
                      name: 'Wade Warren',
                      description: 'Doesn\'t help at all',
                      rate: 1,
                    ),
                  ),
      ),
    );
  }
}
