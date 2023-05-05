import 'package:ambulance/src/bindings/app_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: ((context, child) => GetMaterialApp(
              initialBinding: InitialBinding(),
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorkey,
              title: 'Quiz App',
              getPages: AppRoute.pages(),
              initialRoute: '/',
            )));
  }
}
