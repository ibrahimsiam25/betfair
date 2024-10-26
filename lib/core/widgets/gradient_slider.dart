import 'package:betfair/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_text_styles.dart';

class GradientSlider extends StatefulWidget {
  @override
  GradientSliderState createState() => GradientSliderState();
  final Function(double) onChanged;
  final Color? thumbBorderColor;
  const GradientSlider(
      {super.key, required this.onChanged, this.thumbBorderColor});
}

class GradientSliderState extends State<GradientSlider> {
  double _currentValue = 5.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // شريط التمرير نفسه
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      // شكل مخصص للشريط ليتناسب مع التدرج اللوني
                      trackHeight: 10.0,
                      activeTrackColor: Colors.transparent,
                      inactiveTrackColor: Colors.transparent,
                      thumbShape: CustomCircleThumbShape(
                        thumbBorderColor:
                            widget.thumbBorderColor ?? AppColors.ligthTheme,
                      ), // شكل مخصص للمقبض
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 24.0),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // شريط التمرير بتدرج لوني
                        Container(
                          height: 18.0,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF34FF00),
                                Color(0xFFFFE700),
                                Color(0xFFFE0001)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        // شريط التمرير نفسه
                        Slider(
                          value: _currentValue,
                          min: 0,
                          max: 10,
                          divisions: 10, // تقسيمات دقيقة
                          onChanged: (value) {
                            setState(() {
                              _currentValue = value;
                              widget
                                  .onChanged(value); // تحديث القيمة عند التحريك
                            });
                          },
                          activeColor: Colors
                              .transparent, // إخفاء اللون الافتراضي للشريط
                          inactiveColor: Colors
                              .transparent, // إخفاء اللون الافتراضي للشريط
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Row(children: [
              Padding(
                padding: EdgeInsets.only(top: 19.h),
                child: Text(
                  '0',
                  style: AppTextStyles.fontWhiteW500.copyWith(fontSize: 16.sp),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 19.h),
                child: Text(
                  '10',
                  style: AppTextStyles.fontWhiteW500.copyWith(fontSize: 16.sp),
                ),
              ),
            ]),
            Visibility(
              visible: _currentValue != 0 && _currentValue != 10,
              child: Positioned(
                top: 22.h,
                left: (_currentValue / 10) *
                    (MediaQuery.of(context).size.width -
                        80.w), // لحساب موضع النص
                child: Text(
                  _currentValue.toInt().toString(),
                  style: AppTextStyles.fontWhiteW500.copyWith(fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomCircleThumbShape extends SliderComponentShape {
  final Color thumbBorderColor;

  CustomCircleThumbShape({required this.thumbBorderColor});
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(40.0, 40.0); // حجم المقبض
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    // رسم الحافة الخارجية (border) للمقبض
    final Paint borderPaint = Paint()
      ..color = thumbBorderColor
      ..style = PaintingStyle.stroke // رسم الحافة فقط
      ..strokeWidth = 3.5; // سمك الحافة
    canvas.drawCircle(Offset(center.dx, center.dy - 16), 15.0, borderPaint);

    // رسم الدائرة الداخلية للمقبض
    final Paint thumbPaint = Paint()..color = AppColors.theme;
    canvas.drawCircle(Offset(center.dx, center.dy - 16), 14.0,
        thumbPaint); // تقليل نصف القطر لتتناسب مع الحافة
  }
}
