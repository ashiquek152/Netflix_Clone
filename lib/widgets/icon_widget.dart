import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.iconSize})
      : super(key: key);
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: iconColor,
      size: iconSize,
    );
  }
}
