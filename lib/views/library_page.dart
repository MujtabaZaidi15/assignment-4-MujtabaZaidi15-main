import '/constants/book_model.dart';
import '/constants/book_constant.dart';
import '/model/book_provider.dart';
import '/views/add_book.dart';
import '/widgets/book_list.dart';
import '/widgets/poppinsText.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  void initState() {
    super.initState();
    context.read<BooksProvider>().fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    final books = context.watch<BooksProvider>().books;
    return Scaffold(
      appBar: AppBar(
        title: poppinsText(
            text: 'Library',
            size: 24.0,
            fontWeight: FontWeight.w500,
            fontColor: Colors.white),
        centerTitle: true,
      ),
      body: context.watch<BooksProvider>().books.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: BookList(books: books)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => AddBookPage())));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
