import 'package:betfair/core/routes/app_router.dart';
import 'package:betfair/core/service/shared_preferences_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/service/api_service.dart';
import 'features/fears/manager/fears_cubit.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await SharedPref.init();
  ApiService apiService = ApiService();
  var response = await apiService.makePostRequests();
  if (response.isNotEmpty) {
    runApp(const MyApp());
  } else {
    runApp(const SecondApp());
  }
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
        return BlocProvider(
          create: (context) => FearsCubit()..loadFears(),
          child: MaterialApp.router(
            theme: ThemeData(
              fontFamily: "Inter",
            ),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}

class SecondApp extends StatelessWidget {
  const SecondApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("Second App"),
        ),
      ),
    );
  }
}
