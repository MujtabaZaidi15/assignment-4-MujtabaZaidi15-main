import 'package:flutter/material.dart';
import '/widgets/custom_button.dart';
import '/widgets/poppinsText.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.sufix,
    required this.validationText,
    required this.labelText,
    required this.textFieldController,
  });

  final String hintText;
  final Widget sufix;
  final String validationText;
  final String labelText;
  final TextEditingController textFieldController;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String _enteredText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: TextFormField(
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return widget.validationText;
          }
          return null;
        },
        controller: widget.textFieldController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15, left: 16),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          label: poppinsText(
              text: widget.labelText,
              size: 14.0,
              fontWeight: FontWeight.normal,
              fontColor: Colors.blue),
          suffixIcon: widget.sufix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
