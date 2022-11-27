import 'package:flutter/material.dart';

Widget imageContainer(String imageURL) {
  return Container(
    height: 200,
    width: 150,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
            image: NetworkImage(imageURL), fit: BoxFit.fitHeight),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            blurRadius: 4,
            offset: Offset(4, 8),
          )
        ]),
  );
}
