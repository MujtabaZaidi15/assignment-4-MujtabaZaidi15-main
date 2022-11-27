import '/model/book_json.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BooksRepository {
  static createBook(BookJson book) {
    CollectionReference Book = FirebaseFirestore.instance.collection('books');
    Book.doc(book.bookid).set({
      'bookid': book.bookid,
      'bookName': book.bookName,
      'authors': book.authors,
      'publisherName': book.publisherName,
      'isbn': book.isbn,
      'imageURL': book.imageURL,
      'isFavourite': book.isFavourite,
    });
  }

  static getBooks() async {
    List<BookJson> books = [];

    await FirebaseFirestore.instance
        .collection('books')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        books.add(BookJson.fromJson(doc.data() as Map<String, dynamic>));
      });
    });
    return books;
  }

  static updateFavourite(BookJson book, isFavourite) async {
    CollectionReference Book = FirebaseFirestore.instance.collection('books');
    await Book.doc(book.bookid).update({'isFavourite': isFavourite});
  }
}
