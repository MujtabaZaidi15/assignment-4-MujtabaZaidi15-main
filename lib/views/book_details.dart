import '/model/book_json.dart';
import '/widgets/image_container.dart';
import 'package:flutter/material.dart';
import '/widgets/horizontal_divider.dart';
import '/widgets/poppinsText.dart';
import '/widgets/row_data.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key, required this.book});

  final BookJson book;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: poppinsText(
            text: 'Book Details',
            size: 24.0,
            fontWeight: FontWeight.w500,
            fontColor: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Align(
            alignment: Alignment.topCenter,
            child: imageContainer(widget.book.imageURL),
          ),
          const SizedBox(height: 30.0),
          const HorizontalDivider(),
          const SizedBox(height: 30.0),
          rowData(
              'ISBN: ',
              widget.book.isbn,
              Icon(
                Icons.qr_code,
                color: Colors.blue,
              )),
          const SizedBox(height: 10.0),
          rowData(
              'Book Name: ',
              widget.book.bookName,
              Icon(
                Icons.book,
                color: Colors.blue,
              )),
          const SizedBox(height: 10.0),
          rowData(
              'Authors: ',
              widget.book.authors.join(', '),
              Icon(
                Icons.edit,
                color: Colors.blue,
              )),
          const SizedBox(height: 10.0),
          rowData(
              'Publisher: ',
              widget.book.publisherName,
              Icon(
                Icons.publish,
                color: Colors.blue,
              )),
        ]),
      ),
    );
  }
}
