import 'package:betfair/core/routes/app_router.dart';
import 'package:betfair/core/service/shared_preferences_singleton.dart';
import 'package:betfair/core/constants/app_assets.dart';
import 'package:betfair/features/onboarding/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {
  await ScreenUtil.ensureScreenSize();
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
        );
        return  MaterialApp.router(
       theme: ThemeData(
          fontFamily: "Inter",
        ),
        debugShowCheckedModeBanner: false,
 routerConfig: AppRouter.router,
     
    );
      },
    );
  }
}