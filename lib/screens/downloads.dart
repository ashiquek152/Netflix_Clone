import 'package:flutter/material.dart';
import 'package:netflix_tmdb/widgets/colors.dart';
import 'package:netflix_tmdb/widgets/text_widget.dart';

class Downloads extends StatelessWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Textwidget(text: "Downloads", color: white, fontsize: 20),
      ),
    );
  }
}
