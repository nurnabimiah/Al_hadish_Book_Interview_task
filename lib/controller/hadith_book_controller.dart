










import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/model/hadith_book_model.dart';
import '../db_helper/db_helper.dart';



class HadithBookController extends GetxController {

  RxList<HadithBook> _books = <HadithBook>[].obs;
  List<HadithBook> get books => _books;

  @override
  void onInit() {
    super.onInit();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    await DatabaseHelper.initializeDatabase();
    await _loadBooks();
  }






  Future<void> _loadBooks() async {
    final books = await DatabaseHelper.database.query('hadith_books');
    for (final book in books) {
      final int bookId = book['id'] as int;
      final String name = book['name'] as String;
      final String subName = book['subName'] as String;
      final String image = book['image'] as String;
      final String pageRange = book['page_range'] as String;

      final chapters = await DatabaseHelper.database.query('chapters', where: 'book_id = ?', whereArgs: [bookId]);
      print('...............................>>> ${chapters}');

      final hadithBook = HadithBook(
        id: bookId,
        name: name,
        subName: subName,
        image: image,
        pageRange: pageRange,
        chapters: chapters.map((chapter) {
          final int chapterId = chapter['id'] as int;
          final String title = chapter['title'] as String;
          final String subtitle = chapter['subtitle'] as String;
          return Chapter(id: chapterId, title: title, subtitle: subtitle);
        }).toList(),
      );
      _books.add(hadithBook);
    }
    update();
  }





}


