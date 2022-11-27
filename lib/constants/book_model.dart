class Book {
  final String bookName;
  final List<String> authors;
  final String publisherName;
  final String isbn;
  final String imageURL;
  bool isFavourite;

  Book(
      {required this.bookName,
      required this.authors,
      required this.publisherName,
      required this.isbn,
      required this.imageURL,
      required this.isFavourite});
}
