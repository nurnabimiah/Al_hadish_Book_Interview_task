


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/hadith_book_controller.dart';
import '../../../utils/app_color_resources.dart';
import '../../../utils/app_const_file.dart';
import '../../../utils/app_style.dart';



class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_route';
  HomeScreen({Key? key}) : super(key: key);

  final HadithBookController hadithController = Get.put(HadithBookController());



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColorResources.appPrimaryThemeColor,
        title: Text('Al Hadith'),
        leading: GestureDetector(
            onTap: (){
              print('.......................>>>>>>>>>>drawer is clicked...............');
              Scaffold.of(context).openDrawer();
            },
            child: Image.asset('assets/icons/menu.png')),

      ),
      drawer: Drawer(
        width: 200,
        backgroundColor:  AppColorResources.appPrimaryThemeColor,
      ),

      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: AppColorResources.appBackgroundColor,
            ),

            Image.asset('assets/images/imagetrached.png'),
            Container(
              height:300.h ,
              decoration: BoxDecoration(
                color: AppColorResources.appPrimaryThemeColor.withOpacity(0.99),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                )
              ),
              child: Image.asset('assets/images/imagetrached.png',height: 280.h,width: double.infinity,),

            ),
            Image.asset('assets/images/masque.png'),

            CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16/9,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  autoPlayInterval: Duration(seconds: 7)
                ),

              items: AppConstFile.textItems.map((item) {

                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 20.h),
                      decoration: BoxDecoration(
                        color: Colors.transparent
                      ),
                      child: Text(item, style: TextStyle(fontSize: 16.0),   textAlign: TextAlign.justify,),);
                  },
                );
              }).toList(),

            ),

            Positioned(
              top: 290.h,
              left: 14.w,
              right: 14.w,
              child: Container(
                height: 86.h,
                decoration: BoxDecoration(
                  color: AppColorResources.appPrimaryWhiteColor,
                  boxShadow: [
                    BoxShadow(color: Colors.grey, spreadRadius: 0.7, blurRadius: 2, offset: Offset(0, 2),),],
                  borderRadius: BorderRadius.all(Radius.circular(20.r))
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/last.png',height:32.h,width: 32.w,),
                        SizedBox(height: 11.5,),
                        Text('Last',style: myStyleSourcePoppins(fontSize: 12.sp, color: AppColorResources.appSubtitleTextColor,fontWeight: FontWeight.w500))
                      ],
                    ),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/goto.png',height:32.h,width: 32.w,),
                        SizedBox(height: 11.5,),
                        Text('Go to',style: myStyleSourcePoppins(fontSize: 12.sp, color: AppColorResources.appSubtitleTextColor,fontWeight: FontWeight.w500))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/book.png',height:32.h,width: 32.w,),
                        SizedBox(height: 11.5,),
                        Text('Apps',style: myStyleSourcePoppins(fontSize: 12.sp, color: AppColorResources.appSubtitleTextColor,fontWeight: FontWeight.w500))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/sadaqa.png',height:32.h,width: 32.w,),
                        SizedBox(height: 11.5,),
                        Text('Sadaqa',style: myStyleSourcePoppins(fontSize: 12.sp, color: AppColorResources.appSubtitleTextColor,fontWeight: FontWeight.w500))
                      ],
                    ),


                  ],
                ),

              ),
            ),

            ///...................all book list.................................

            Positioned(
                 top: 410.h,
                 left: 14.w,
                 right: 14.w,
                child:  Text('All Hadith Book',style: myStyleSourcePoppins(fontSize: 15.sp, color: AppColorResources.appPrimaryBlackColor,fontWeight: FontWeight.w600))
            ),


            GetBuilder<HadithBookController>(
              builder: (controller) {
                return Positioned(
                    top: 445.h,
                    left: 14.w,
                    right: 14.w,
                    child:  Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.separated(

                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.books.length,
                          separatorBuilder: (BuildContext context,index)=>SizedBox(height:12.h ,),
                          itemBuilder: (BuildContext context,index){
                           final book = controller.books[index];
                            return Container(
                              height: 70.h,
                              decoration: BoxDecoration(
                                  color:AppColorResources.appPrimaryWhiteColor,
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey, spreadRadius: 0.0, blurRadius: 0.0, offset: Offset(0, 0.1),),],
                                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                                 child:Padding(
                                   padding:  EdgeInsets.only(left: 14.0.w,right: 14.w),
                                   child: Row(
                                     children: [

                                       Row(

                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Image.asset('assets/images/book1.png', fit: BoxFit.cover),
                                           ),
                                           Column(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(book.name,style: myStyleSourcePoppins(fontSize: 14.sp, color: AppColorResources.appPrimaryBlackColor,fontWeight: FontWeight.w500)),
                                               Text(book.subName,style: myStyleSourcePoppins(fontSize: 12.sp, color: AppColorResources.appPrimaryBlackColor.withOpacity(0.5),fontWeight: FontWeight.w400)),

                                             ],
                                           ),
                                         ],
                                       ),
                                       Spacer(),
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         crossAxisAlignment: CrossAxisAlignment.end,
                                         children: [
                                           Text(book.pageRange,style: myStyleSourcePoppins(fontSize: 14.sp, color: AppColorResources.appPrimaryBlackColor,fontWeight: FontWeight.w500)),
                                           Text('Hadith',style: myStyleSourcePoppins(fontSize: 12.sp, color: AppColorResources.appPrimaryBlackColor.withOpacity(0.5),fontWeight: FontWeight.w400)),
                                         ],
                                       )

                                     ],
                                   ),
                                 )


                            );
                        },


                      ),
                    )
                );
              }
            ),









          ],
        ),
      ),

    );
  }
}


