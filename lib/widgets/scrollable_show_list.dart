import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:netflix_tmdb/widgets/colors.dart';
import 'package:netflix_tmdb/widgets/text_widget.dart';
import 'package:netflix_tmdb/screens/movies_description.dart';

class ScrollableRowList extends StatelessWidget {
  const ScrollableRowList(
      {Key? key,
      required this.header,
      required this.list,
      required this.height,
      required this.width})
      : super(key: key);

  final String header;
  final List list;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Textwidget(
            text: header,
            color: white,
            fontsize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
                children: list.isNotEmpty
                    ? List.generate(
                        list.length,
                        (index) => InkWell(
                              onTap: () {
                                Get.to(() {
                                  return Description(
                                    name: list[index]['title'],
                                    description: list[index]['overview'],
                                    bannerUrl:
                                        "https://image.tmdb.org/t/p/w500${list[index]['backdrop_path']}",
                                    vote:
                                        list[index]['vote_average'].toString(),
                                    launchDate: list[index]['release_date'] ??
                                        "Not availabe",
                                    posterUrl:
                                        "https://image.tmdb.org/t/p/w500${list[index]['poster_path']}",
                                  );
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      width: height,
                                      height: width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://image.tmdb.org/t/p/w500${list[index]['poster_path']}"), //link provided by TMDB APi
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(6))),
                                  // Container()
                                ],
                              ),
                            ))
                    : List.generate(
                        6,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 8),
                          width: height,
                          height: width,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child:
                            CircularProgressIndicator(
                              color: red,
                            ), 
                          ),
                        ),
                      )),
          ),
        ),
      ],
    );
  }
}
