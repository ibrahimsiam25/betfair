
import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height*0.3,
      height: MediaQuery.of(context).size.height*0.3,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color:
              AppColors.darkPrimary, // Set your desired border color here
          width: 7, // Set your desired border width here
        ),
      ),
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.height*0.3,
        backgroundImage:const AssetImage(Assets.imagesMan), // Replace with your image URL
        // Alternatively, you can use child: Text('A') for an initial
      ),
    );
  }
}
