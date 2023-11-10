





import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../data/model/hadith_book_model.dart';



class DatabaseHelper {
  static late Database _database;

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
      final book1 = HadithBook(
        name: 'Book 1',
        subName: 'Imam Bukhari',
        image: 'assets/images/book1.png',
        pageRange: '7563',
        chapters: [
          Chapter(title: 'Chapter 1.1', subtitle: 'Subtitle 1.1'),
          Chapter(title: 'Chapter 1.2', subtitle: 'Subtitle 1.2'),
        ],
      );

      final book2 = HadithBook(
        name: 'Book 1',
        subName: '3033',
        image: 'assets/images/book1.png',
        pageRange: '3033',
        chapters: [
          Chapter(title: 'Chapter 1.1', subtitle: 'Subtitle 1.1'),
          Chapter(title: 'Chapter 1.2', subtitle: 'Subtitle 1.2'),
        ],
      );

      final book3 = HadithBook(
        name: 'Book 1',
        subName: 'Imam Bukhari',
        image: 'assets/images/book1.png',
        pageRange: '5768',
        chapters: [
          Chapter(title: 'Chapter 1.1', subtitle: 'Subtitle 1.1'),
          Chapter(title: 'Chapter 1.2', subtitle: 'Subtitle 1.2'),
        ],
      );


      await _database.insert('hadith_books', book1.toMap());
      await _database.insert('hadith_books', book2.toMap());
      await _database.insert('hadith_books', book3.toMap());
    }

    final insertedBooks = await _database.query('hadith_books');

    for (final book in insertedBooks) {
      final bookId = book['id'] as int;
      final chaptersExist = await _database.query('chapters', where: 'book_id = ?', whereArgs: [bookId]);

      if (chaptersExist.isEmpty) {
        final hadithBook = HadithBook.fromMap(book);

        for (final chapter in hadithBook.chapters) {
          await _database.insert('chapters', chapter.toMap(bookId));
        }
      }
    }
  }











  // static Future<void> insertSampleData() async {
  //   final books = await _database.query('hadith_books');
  //   if (books.isEmpty) {
  //     await _database.insert('hadith_books',
  //       {
  //         'name': 'Book 1',
  //         'image': 'image_url_for_book_1',
  //         'page_range': 'Page Range for Book 1',
  //       },
  //     );
  //
  //     await _database.insert(
  //       'hadith_books',
  //       {
  //         'name': 'Book 2',
  //         'image': 'image_url_for_book_2',
  //         'page_range': 'Page Range for Book 2',
  //       },
  //     );
  //   }
  //
  //   final insertedBooks = await _database.query('hadith_books');
  //
  //   for (final book in insertedBooks) {
  //     final bookId = book['id'] as int;
  //     final chaptersExist = await _database.query('chapters', where: 'book_id = ?', whereArgs: [bookId]);
  //
  //     if (chaptersExist.isEmpty) {
  //       await _database.insert(
  //         'chapters',
  //         {
  //           'book_id': bookId,
  //           'title': 'Chapter $bookId.1',
  //           'subtitle': 'Subtitle $bookId.1',
  //         },
  //       );
  //
  //       await _database.insert(
  //         'chapters',
  //         {
  //           'book_id': bookId,
  //           'title': 'Chapter $bookId.2',
  //           'subtitle': 'Subtitle $bookId.2',
  //         },
  //       );
  //     }
  //   }
  // }

  static Database get database => _database;
}