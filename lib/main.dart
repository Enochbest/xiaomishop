import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(
      ScreenUtilInit(
      designSize: const Size(1080, 2400),//设计稿的高度和宽度1080，2400
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Application",
              theme: ThemeData(primarySwatch: Colors.grey),
              defaultTransition: Transition.rightToLeft,
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
            );
      })
  );
}
