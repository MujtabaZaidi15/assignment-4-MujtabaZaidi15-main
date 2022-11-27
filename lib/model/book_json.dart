class BookJson {
  final String bookid;
  final String bookName;
  final List<String> authors;
  final String publisherName;
  final String isbn;
  final String imageURL;
  bool isFavourite;

  BookJson(
      {required this.bookid,
      required this.bookName,
      required this.authors,
      required this.publisherName,
      required this.isbn,
      required this.imageURL,
      required this.isFavourite});

  static BookJson fromJson(Map<String, dynamic> json) => BookJson(
      bookid: json['bookid'],
      bookName: json['bookName'],
      authors: List<String>.from(json["authors"].map((x) => x)),
      publisherName: json['publisherName'],
      isbn: json['isbn'],
      imageURL: json['imageURL'],
      isFavourite: json['isFavourite']);
}
