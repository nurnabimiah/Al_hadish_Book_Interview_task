





import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../data/model/hadith_book_model.dart';



class DatabaseHelper {
  static late Database _database;
  static var chapter1;
  static var chapter2;
  static var chapter3;



  static Future<void> initializeDatabase() async {


    _database = await openDatabase(
      join(await getDatabasesPath(), 'hadith_database.db'),

      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE hadith_books(
            id INTEGER PRIMARY KEY,
            name TEXT,
            subName Text,
            image TEXT,
            page_range TEXT
          )
        ''');
        db.execute('''
          CREATE TABLE chapters(
            id INTEGER PRIMARY KEY,
            book_id INTEGER,
            title TEXT,
            subtitle TEXT
          )
        ''');
      },
      version: 1,
    );
    await insertSampleData();
  }




  static Future<void> insertSampleData() async {
    final books = await _database.query('hadith_books');
    if (books.isEmpty) {
      List<HadithBook> hadithBookList = [
        HadithBook(
          name: 'Sahih Muslim',
          subName: 'Imam Bukhari',
          image: 'assets/images/book1.png',
          pageRange: '7563',
          chapters: [
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            // Add more chapters as needed
          ],
        ),
        HadithBook(
          name: 'Muslime book',
          subName: 'Imam Muslim',
          image: 'assets/images/book2.png',
          pageRange: '3033',
          chapters: [
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7'),
            // Add more chapters as needed
          ],
        ),
        HadithBook(
          name: 'Another Book',
          subName: 'Subtitle',
          image: 'assets/images/book1.png',
          pageRange: '5758',
          chapters: [
            Chapter(title: 'Subject Name', subtitle: 'Hadith Range 1-7')
            // Add more chapters as needed
          ],
        ),
      ];

      for (int j = 0; j < hadithBookList.length; j++) {
        final HadithBook book = hadithBookList[j];

        final bookId = await _database.insert('hadith_books', book.toMap());

        List<Chapter> chapters = book.chapters ?? [];
        for (int i = 0; i < chapters.length; i++) {
          var chapter = Chapter(
            title: chapters[i].title,
            subtitle: chapters[i].subtitle,
            bookId: bookId.toString(),
          );
          await _database.insert('chapters', chapter.toMap());
        }
      }
    }
  }

















  static Database get database => _database;
}


