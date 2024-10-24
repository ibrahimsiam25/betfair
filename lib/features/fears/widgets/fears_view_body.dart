import 'package:betfair/features/fears/widgets/fear_element.dart';
import 'package:betfair/features/fears/widgets/fear_element_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/static/fear_static_data.dart';

class FearsViewBody extends StatefulWidget {
  const FearsViewBody({
    super.key,
  });

  @override
  State<FearsViewBody> createState() => _FearsViewBodyState();
}

class _FearsViewBodyState extends State<FearsViewBody> {
  int state = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          Navigator.of(context).pop(false);
          state = 0;
        });
        return false;
      },
      child: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.h, top: 16.h),
        child: state == 0
            ? Column(
                children: [
                  ...List.generate(
                    6,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            state = 1;
                            this.index = index;
                          });
                        },
                        child: FearElement(
                          fearModel: fearStaticData[index],
                        ),
                      );
                    },
                  )
                ],
              )
            : FearElementDetails(
                fearModel: fearStaticData[index],
              ),
      ),
    );
  }
}
