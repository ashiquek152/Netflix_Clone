import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix_tmdb/screens/screen_search.dart';
import 'package:netflix_tmdb/widgets/colors.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_tmdb/widgets/text_widget.dart';

class ScreenComingsoon extends StatefulWidget {
  const ScreenComingsoon({Key? key}) : super(key: key);

  @override
  State<ScreenComingsoon> createState() => _ScreenComingsoonState();
}

class _ScreenComingsoonState extends State<ScreenComingsoon> {
  List upcomingList = [];

  @override
  void initState() {
    // TODO: implement initState
    getUpcomingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Textwidget(text: "Upcoming Movies", color: red, fontsize: 25,fontWeight: FontWeight.w700,),
            ),
            upcomingList.isNotEmpty? Column(
                children: List.generate(
                    upcomingList.length,
                    (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: white,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500${upcomingList[index]['backdrop_path']}"),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Textwidget(
                                text: upcomingList[index]['title'],
                                color: white,
                                fontsize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                             Padding(
                              padding: const EdgeInsets.only(left:10.0,bottom: 10.0),
                              child: Textwidget(
                                text: "⭐  ${upcomingList[index]['vote_average'].toString()}",
                                color: white,
                                fontsize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                             Padding(
                              padding: const EdgeInsets.only(left:10.0,bottom: 10.0),
                              child: Textwidget(
                                text: upcomingList[index]['overview'].toString(),
                                color: white,
                                fontsize: 14,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            
                          ],
                        ))):Center(
                          child: Textwidget(text: "Loading...Please wait...", color: white, fontsize: 18),
                        ),
          ],
        ),
      )),
    );
  }

  Future<List> getUpcomingList() async {
    final apiResponse = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/upcoming?api_key=$API_KEY"));
    Map<String, dynamic> bodyJson = await jsonDecode(apiResponse.body);
    if (apiResponse.statusCode==200) {
      setState(() {
      upcomingList = bodyJson['results'];
    });
    }  
    return upcomingList;
  }
}
