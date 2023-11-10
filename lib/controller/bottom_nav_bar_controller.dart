




import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/screens/book_mark_screen/book_mark_screen.dart';
import '../view/screens/home_screen/home_screen.dart';
import '../view/screens/note_screen/note_screen.dart';
import '../view/screens/profile_screen/profile_screen.dart';

class BottomNavigationController extends GetxController{

  int selectedIndex =0;

  List<Widget> screens = [
    HomeScreen(),
    BookMarkScreen(),
    NoteScreen(),
    BookMarkScreen(),
    ProfileScreen()

  ];

  Widget get currentScreen => screens[selectedIndex];


  void changeIndex(index){
    selectedIndex = index;
    update();
  }


}