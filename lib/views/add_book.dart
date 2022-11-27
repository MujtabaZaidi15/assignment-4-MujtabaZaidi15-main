import '/constants/book_model.dart';
import '/model/book_json.dart';
import '/model/book_repository.dart';
import '/widgets/custom_alertdialog.dart';
import '/widgets/textformfield.dart';
import '/widgets/poppinsText.dart';
import '/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController publisherController = TextEditingController();
  TextEditingController isbnController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController;
    authorController;
    publisherController;
    isbnController;
    imageController;
    formKey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: poppinsText(
              text: 'please add a Book !',
              size: 24.0,
              fontWeight: FontWeight.w500,
              fontColor: Colors.white),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20.0),
                    CustomTextField(
                        hintText: 'Enter movie name',
                        sufix: const SizedBox(),
                        validationText: 'movie field cannot be empty',
                        labelText: 'Movie name',
                        textFieldController: nameController),
                    const SizedBox(height: 20.0),
                    CustomTextField(
                        hintText: 'Enter author(s) name(s)',
                        sufix: const SizedBox(),
                        validationText: 'authors field cannot be empty',
                        labelText: 'Author name',
                        textFieldController: authorController),
                    const SizedBox(height: 20.0),
                    CustomTextField(
                        hintText: 'Enter publisher name',
                        sufix: const SizedBox(),
                        validationText: 'publisher field cannot be empty',
                        labelText: 'Publisher name',
                        textFieldController: publisherController),
                    const SizedBox(height: 20.0),
                    CustomTextField(
                        hintText: 'Enter ISBN',
                        sufix: const SizedBox(),
                        validationText: 'ISBN field cannot be empty',
                        labelText: 'ISBN',
                        textFieldController: isbnController),
                    const SizedBox(height: 20.0),
                    CustomTextField(
                        hintText: 'Enter image URL',
                        sufix: const SizedBox(),
                        validationText: 'Image field cannot be empty',
                        labelText: 'Image URL',
                        textFieldController: imageController),
                    Spacer(),
                    CustomButton(
                        text: 'Submit',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            BooksRepository.createBook(BookJson(
                                bookid: idGenerator(),
                                bookName: nameController.text,
                                authors: authorController.text.split(', '),
                                publisherName: publisherController.text,
                                isbn: isbnController.text,
                                imageURL: imageController.text,
                                isFavourite: false));

                            nameController.clear();
                            authorController.clear();
                            publisherController.clear();
                            isbnController.clear();
                            imageController.clear();

                            showDialog(
                                useRootNavigator: false,
                                context: context,
                                builder: (BuildContext context) =>
                                    AddBookPopup());
                          }
                        },
                        color1: Colors.blue,
                        color2: Colors.white)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

String idGenerator() {
  final now = DateTime.now();
  return now.microsecondsSinceEpoch.toString();
}
