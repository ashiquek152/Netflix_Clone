// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  Textwidget(
      {Key? key,
      required this.text,
      required this.color,
      required this.fontsize,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal})
      : super(key: key);
  final String text;
  final Color color;
  final double fontsize;
  FontWeight fontWeight;
  FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontsize,
          fontWeight: fontWeight,
          fontStyle: fontStyle),
    );
  }
}

int selectedItem = 0;

//
//
//
//
//
