import '/model/book_json.dart';
import 'package:flutter/material.dart';

class BookTile extends StatefulWidget {
  BookTile(
      {super.key,
      required this.book,
      required this.onTapHeart,
      required this.onTapBook});

  final BookJson book;
  VoidCallback onTapHeart;
  VoidCallback onTapBook;

  @override
  State<BookTile> createState() => _BookTileState();
}

class _BookTileState extends State<BookTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        onTap: widget.onTapBook,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.book.imageURL),
          ),
          title: Text(widget.book.bookName),
          subtitle: Text((widget.book.authors).join(', ')),
          trailing: InkWell(
            onTap: widget.onTapHeart,
            child: Icon(Icons.favorite,
                color: widget.book.isFavourite ? Colors.red : Colors.grey),
          ),
        ),
      ),
    );
  }
}
