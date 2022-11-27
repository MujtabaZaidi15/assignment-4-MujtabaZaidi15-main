import '/model/book_json.dart';
import '/model/book_repository.dart';
import '/views/book_details.dart';
import 'package:flutter/material.dart';
import '/widgets/book_tile.dart';

class BookList extends StatefulWidget {
  const BookList({super.key, required this.books});

  final List<BookJson> books;

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return BookTile(
            book: widget.books[index],
            onTapHeart: () {
              setState(() {
                widget.books[index].isFavourite =
                    !widget.books[index].isFavourite;
                BooksRepository.updateFavourite(
                    widget.books[index], widget.books[index].isFavourite);
              });
            },
            onTapBook: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      BookDetails(book: widget.books[index])));
            },
          );
        });
  }
}
