import '/views/library_page.dart';
import '/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AddBookPopup extends StatefulWidget {
  AddBookPopup({super.key});

  @override
  State<AddBookPopup> createState() => _AddBookPopupState();
}

class _AddBookPopupState extends State<AddBookPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Image.network(
                'https://i0.wp.com/codemyui.com/wp-content/uploads/2015/10/progress-and-tick-icon-animation.gif?fit=880%2C440&ssl=1'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Book Added",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          CustomButton(
              text: 'Go to your library',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LibraryPage()));
              },
              color1: Colors.blue,
              color2: Colors.white),
        ],
      ),
    ));
  }
}
