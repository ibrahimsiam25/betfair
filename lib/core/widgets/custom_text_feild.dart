import 'dart:ui';
import 'package:betfair/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     width: double.infinity,
     height: 50.h,
     decoration: BoxDecoration(
       color: AppColors.darkPrimary.withOpacity(0.5), // الاحتفاظ بلون الخلفية الأصلي مع بعض الشفافية
       borderRadius: const BorderRadius.all(
         Radius.circular(8),
       ),
       boxShadow: [
         BoxShadow(
           color: AppColors.darkPrimary.withOpacity(0.1),
           offset: const Offset(0, 4), // الإزاحة Y=4 و X=0
           blurRadius: 30, // مقدار الضبابية
           spreadRadius: 0, // مقدار الانتشار
         ),
       ],
     ),
     child: ClipRRect(
       borderRadius: const BorderRadius.all(
         Radius.circular(8), // نفس الـ border-radius لتجنب تجاوز الحواف
       ),
       child: BackdropFilter(
         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // إضافة الضبابية
         child: Container(
           color: Colors.black.withOpacity(0.2), // استخدام لون شفاف لزيادة تأثير الشفافية
           child: TextField(
             decoration: InputDecoration(
               border: InputBorder.none, // إزالة الحدود الافتراضية
               contentPadding: EdgeInsets.symmetric(horizontal: 20), // تباعد داخلي
               
             ),
             style: TextStyle(
               color: Colors.white, // لون النص المدخل
               fontSize: 18, // حجم النص
             ),
             cursorColor: AppColors.darkPrimary,
           ),
         ),
       ),
     ),
    );
  }
}
