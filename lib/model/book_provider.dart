import 'package:flutter/cupertino.dart';
import '/model/book_json.dart';
import '/model/book_repository.dart';

class BooksProvider extends ChangeNotifier {
  List<BookJson> books = [];

  void fetchBooks() async {
    // isUsersFetching = true;
    // notifyListeners();
    books = await BooksRepository.getBooks();
    // isUsersFetching = false;
    notifyListeners();
  }
}
