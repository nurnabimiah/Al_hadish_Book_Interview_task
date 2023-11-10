

import 'package:al_hadish_book_interview/controller/hadith_book_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'controller/bottom_nav_bar_controller.dart';





final sl = GetIt.instance;

Future<void> init() async {

  Get.lazyPut(() => BottomNavigationController(), fenix: true);
  Get.lazyPut(() => HadithBookController(), fenix: true);


  /// External pocket lock
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => Dio());
}