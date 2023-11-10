



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/bottom_nav_bar_controller.dart';
import '../../utils/app_color_resources.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget({Key? key}) : super(key: key);
  final controller = Get.put(BottomNavigationController());


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left:10.w,right:10.w,bottom: 7.h),
      child: Theme(
        data: Theme.of(context).copyWith(
          // Set a transparent canvas color
          canvasColor: AppColorResources.appPrimaryWhiteColor
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event_note),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.save),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
            currentIndex: controller.selectedIndex,
            onTap: controller.changeIndex,
          ),
        ),
      ),
    );
  }






}



