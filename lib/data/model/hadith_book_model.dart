









class HadithBook {
  final int? id;
  final String name;
  final String subName;
  final String image;
  final String pageRange;
  final List<Chapter> chapters;

  HadithBook({this.id, required this.name,required this.subName, required this.image, required this.pageRange, required this.chapters});

  // Convert HadithBook instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'subName':subName,
      'image': image,
      'page_range': pageRange,
    };
  }

  // Create a HadithBook instance from a map
  static HadithBook fromMap(Map<String, dynamic> map) {
    return HadithBook(
      id: map['id'],
      name: map['name'],
      subName: map['subName'],
      image: map['image'],
      pageRange: map['page_range'],
      chapters: [],
    );
  }
}

class Chapter {
  final int? id;
  final String title;
  final String subtitle;

  Chapter({this.id, required this.title, required this.subtitle});

  // Convert Chapter instance to a map
  Map<String, dynamic> toMap(int bookId) {
    return {
      'id': id,
      'book_id': bookId,
      'title': title,
      'subtitle': subtitle,
    };
  }

  // Create a Chapter instance from a map
  static Chapter fromMap(Map<String, dynamic> map) {
    return Chapter(
      id: map['id'],
      title: map['title'],
      subtitle: map['subtitle'],
    );
  }
}
