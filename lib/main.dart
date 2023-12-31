
import 'package:al_hadish_book_interview/utils/app_color_resources.dart';
import 'package:al_hadish_book_interview/view/screens/chapter_list_screen/chapter_list_screen.dart';
import 'package:al_hadish_book_interview/view/screens/home_screen/home_screen.dart';
import 'package:al_hadish_book_interview/view/screens/landing_screen/landing_screen.dart';
import 'package:al_hadish_book_interview/view/screens/start_screen/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColorResources.appPrimaryThemeColor
    ));

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Al Hadith Book',
          theme: ThemeData(
            primarySwatch: AppColorResources.customPrimarySwatch,
            iconTheme: const IconThemeData(color: Colors.black),
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),

          initialRoute: StartScreen.routeName,

          getPages: [
            GetPage(name: StartScreen.routeName, page: () =>StartScreen()),
            GetPage(name: LandigScreen.routeName, page: () =>LandigScreen()),
            GetPage(name: HomeScreen.routeName, page: () =>HomeScreen()),
            GetPage(name: ChapterListScreen.routeName, page: () =>ChapterListScreen()),

          ],
        );
      },
    );
  }
}


