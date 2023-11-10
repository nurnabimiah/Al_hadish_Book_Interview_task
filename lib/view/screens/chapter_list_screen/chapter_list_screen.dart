



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/hadith_book_controller.dart';
import '../../../data/model/hadith_book_model.dart';
import '../../../utils/app_color_resources.dart';
import '../../../utils/app_style.dart';
import '../../widgets/search_text_filed_widget.dart';

class ChapterListScreen extends StatelessWidget {

  final HadithBook? book;
  ChapterListScreen({Key? key, this.book}) : super(key: key);

  //final chatListController =Get.put(HadithBookController());

  @override
  Widget build(BuildContext context) {
    print('................................${book!.chapters!.length}');
    return Scaffold(
      backgroundColor: AppColorResources.appPrimaryThemeColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios, color: AppColorResources.appPrimaryWhiteColor, size: 24.sp),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book!.name, style: myStyleSourcePoppins(fontSize: 16.sp, color: AppColorResources.appPrimaryWhiteColor, fontWeight: FontWeight.w600)),
                Text('Books Name', style: myStyleSourceInter(fontSize: 12.sp, color: AppColorResources.appPrimaryWhiteColor, fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: AppColorResources.appPrimaryWhiteColor, size: 24.sp)),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.only(top: 10.0.h),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColorResources.appBackgroundColor.withOpacity(0.97),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 12.0.w, right: 12.w, top: 10.h),
              child: Column(
                children: [
                  MySearchTextField(),

                  SizedBox(height: 10.h,),

                  Expanded(
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: book!.chapters!.length,
                      separatorBuilder: (BuildContext context, index) => SizedBox(height: 10.h),
                      itemBuilder: (BuildContext context, ind) {
                        final chapter = book!.chapters![ind];

                        return Container(
                          //height: 68.h,
                          decoration: BoxDecoration(
                            color: AppColorResources.appPrimaryWhiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),

                          child: Padding(
                            padding:  EdgeInsets.all(14),
                            child: Row(
                              children: [
                                Container(
                                  height:35.h,
                                  width: 35.w,
                                  decoration: BoxDecoration(
                                    color: AppColorResources.appPrimaryThemeColor,
                                    shape: BoxShape.circle
                                  ),
                                  child: Center(child: Text('${ind.toString()}', style: myStyleSourceInter(fontSize: 14.sp, color: AppColorResources.appPrimaryWhiteColor),)),
                                ),
                                SizedBox(width:15.w ,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(chapter.title, style:myStyleSourcePoppins(fontSize: 14.sp, color: Color(0XFF5D646F),fontWeight: FontWeight.w500),),
                                    Text(chapter.subtitle, style:myStyleSourceInter(fontSize: 12.sp, color:Colors.grey,fontWeight:FontWeight.w500),),
                                  ],
                                )
                              ],
                            ),
                          ),

                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


