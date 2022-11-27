import 'package:flutter/material.dart';
import '/widgets/poppinsText.dart';

Widget rowData(String bookProp, String propName, Icon icon) {
  return Container(
    alignment: Alignment.centerRight,
    height: 60,
    width: 400,
    child: Row(
      children: [
        SizedBox(
          height: 28,
          width: 28,
          child: icon,
        ),
        const SizedBox(width: 16),
        poppinsText(
          text: bookProp,
          size: 14.0,
          fontWeight: FontWeight.w500,
          fontColor: Colors.black,
        ),
        Spacer(),
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: poppinsText(
              text: propName,
              size: 14.0,
              fontWeight: FontWeight.w500,
              fontColor: Colors.grey.shade500),
        ),
      ],
    ),
  );
}
