import 'package:betfair/core/routes/app_router.dart';
import 'package:betfair/core/service/api_service.dart';
import 'package:betfair/core/service/shared_preferences_singleton.dart';
import 'package:betfair/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/fears/manager/fears_cubit.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await SharedPref.init();
  WidgetsFlutterBinding.ensureInitialized();

  ApiHandler apiHandler = ApiHandler();

  bool result = await apiHandler.handleRequests();
 if (result) {
  final String url = "https://${apiHandler.link}";
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WebViewScreen(url: url),
      ),
    );
  } else {
    runApp(const MyApp());
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
