import 'package:betfair/core/theme/app_text_styles.dart';
import 'package:betfair/core/widgets/custom_scaffold.dart';
import 'package:betfair/features/offender/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'view_offender_element.dart';

class ViewOffenderSocials extends StatelessWidget {
  const ViewOffenderSocials({super.key});

  void _launchURL() async {
    final Uri url = Uri.parse('https://github.com/itiswd');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const OffenderBackButton(),
                  Text(
                    'Albert Flores',
                    style: AppTextStyles.fontPrimaryW700.copyWith(
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(width: 88.w),
                ],
              ),
              SizedBox(height: 12.h),
              ViewOffenderElement(
                title: 'Instagram',
                element: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 40.h,
                    child: Center(
                      child: Text(
                        'Link',
                        style: AppTextStyles.fontBlackW700.copyWith(
                          fontSize: 20.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              ViewOffenderElement(
                title: 'LinkedIN',
                element: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 40.h,
                    child: Center(
                      child: Text(
                        'Link',
                        style: AppTextStyles.fontBlackW700.copyWith(
                          fontSize: 20.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
