class Books {
  /* int price;
  String id,
      title,
      description,
      aboutAuthor,
      author,
      autdiLeng,
      coverUrl,
      rating,
      category;

  Books(
      {required this.id,
      required this.title,
      required this.description,
      required this.aboutAuthor,
      required this.author,
      required this.autdiLeng,
      required this.category,
      required this.rating,
      required this.coverUrl,
      required this.price});*/

  final int id;
  final String bookTitle;
  final String bookDescription;
  final String coverUrl;

  final String authorName;
  final String aboutAuthor;
  final int price;
  final int pages;
  final String audioLength;

  Books({
    required this.id,
    required this.bookTitle,
    required this.bookDescription,
    required this.authorName,
    required this.aboutAuthor,
    required this.coverUrl,
    required this.price,
    required this.pages,
    required this.audioLength,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      id: json['ID'],
      bookTitle: json['BookTitle'],
      bookDescription: json['BookDescription'],
      authorName: json['AuthorName'],
      aboutAuthor: json['AboutAuthor'],
      coverUrl: json['coverUrl'],
      price: json['Price'],
      pages: json['Pages'],
      audioLength: json['AudioLength'],
    );
  }
}
