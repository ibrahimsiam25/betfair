import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_text_styles.dart';


class NewFearAppBar extends StatelessWidget {
  const NewFearAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
    
      Transform.translate(
        offset:const Offset(0, -5), // تحريك للأعلى بمقدار -5 (يمكنك تغيير هذه القيمة)
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Back",
            style: AppTextStyles.fontPrimaryW500.copyWith(
              fontSize: 22.sp,
            ),
          ),
        ),
      ),
      
      const Spacer(flex: 3),
    
     
      Transform.translate(
        offset:const Offset(0, 5), 
        child: Text(
          "New Fear",
          style: AppTextStyles.fontWhiteW700.copyWith(
            fontSize: 28.sp,
          ),
        ),
      ),
    
      const Spacer(flex: 5),
    ],
    );
  }
}
