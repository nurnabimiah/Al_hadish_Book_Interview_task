



import 'package:al_hadish_book_interview/utils/app_color_resources.dart';
import 'package:al_hadish_book_interview/utils/app_style.dart';
import 'package:al_hadish_book_interview/view/screens/landing_screen/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = '/start_screen_route';
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorResources.appPrimaryThemeColor,

      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LandigScreen()), (route) => false);
          },
          child: Container(
            height: 46.h,
            width: 200.w,
            decoration: BoxDecoration(
              color: AppColorResources.appPrimaryWhiteColor,
              borderRadius: BorderRadius.all(Radius.circular(14.r))
            ),
            child: Center(child: Text('Go to Hadith',style: myStyleSourcePoppins(fontSize: 16.sp, color: Colors.black87,fontWeight: FontWeight.w500),)),
          ),
        ),
      ),


    );
  }
}
