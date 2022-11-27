import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget poppinsText(
    {required text,
    required size,
    required FontWeight fontWeight,
    required Color fontColor}) {
  return Text(
    text,
    style: GoogleFonts.poppins(
        fontSize: size, fontWeight: fontWeight, color: fontColor),
  );
}
