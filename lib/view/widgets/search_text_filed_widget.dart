




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_color_resources.dart';
import '../../utils/app_style.dart';

class MySearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0, // Set the height
      child: TextField(
        style: TextStyle(color: Colors.black), // Text color
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white, // Fill color
          hintText: 'Search by chapter',
          hintStyle: myStyleSourcePoppins(fontSize: 14.sp, color: AppColorResources.searchHintTextStyle,fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12), // Adjust vertical padding
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // No border
            borderRadius: BorderRadius.circular(10.0.r), // Optional: Add rounded corners
          ),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}






