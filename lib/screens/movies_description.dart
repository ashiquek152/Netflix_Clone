import 'package:flutter/material.dart';
import 'package:netflix_tmdb/widgets/colors.dart';
import 'package:netflix_tmdb/widgets/text_widget.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.name,
    required this.description,
    required this.bannerUrl,
    required this.vote,
    required this.launchDate,
    required this.posterUrl,
  }) : super(key: key);

  final String? name, description, bannerUrl, posterUrl, vote, launchDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SizedBox(
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerUrl!,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                      bottom: 10,
                      child: Textwidget(
                        text: "⭐ Average Rating $vote",
                        color: white,
                        fontsize: 18,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(10),
              child: name != null
                  ? Textwidget(
                      text: name!,
                      color: white,
                      fontsize: 24,
                      fontWeight: FontWeight.bold,
                    )
                  : Textwidget(
                      text: "Not loading",
                      color: red,
                      fontsize: 18,
                      fontStyle: FontStyle.italic,
                    ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Textwidget(
                text: "Release Date: $launchDate",
                color: white,
                fontsize: 14,
              ),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  margin: const EdgeInsets.all(5),
                  child: Image.network(posterUrl!),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Textwidget(
                      text: description ?? "Not loding",
                      color: white,
                      fontsize: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
