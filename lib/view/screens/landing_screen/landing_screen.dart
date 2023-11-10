




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/bottom_nav_bar_controller.dart';
import '../../../utils/app_color_resources.dart';
import '../../widgets/bottom_navbar_widget.dart';

class LandigScreen extends StatelessWidget {

  static const String routeName = '/landing_route';
  const LandigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      init: BottomNavigationController(),
      builder: (navController) {
        return Scaffold(
          backgroundColor: AppColorResources.appBackgroundColor,

          body: navController.currentScreen,

          bottomNavigationBar:  BottomNavigationBarWidget(),

        );
      }
    );
  }
}
