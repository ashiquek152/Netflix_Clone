// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:netflix_tmdb/widgets/colors.dart';
import 'package:netflix_tmdb/widgets/scrollable_show_list.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const String API_KEY = "3c12ddf4e10d971f7c8e87cb7dada16c";
const String ACCESS_TOKEN =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYzEyZGRmNGUxMGQ5NzFmN2M4ZTg3Y2I3ZGFkYTE2YyIsInN1YiI6IjYyYTJlNjkzZTIyZDI4MDA2NjhhNTliOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cHcFvxrL8NUImzHxnKEkEI9U43nR4zvwsqEP3WvvtUA";

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List popularList = [];
  List upcomingList = [];
  List nowPlayingList = [];

  @override
  void initState() {
    getPopularList();
    getNowPlayingList();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScrollableRowList(
              header: "Popular Movies",
              list: popularList,
              height: 110,
              width: 160,
            ),
            ScrollableRowList(
              header: "Upcoming Movies",
              list: upcomingList,
              height: 110,
              width: 160,
            ),
            ScrollableRowList(
              header: "Now Playing",
              list: nowPlayingList,
              height: 165,
              width: 300,
            ),
            const SizedBox(height: 30),
          ],
        ),
      )),
    );
  }

  //
  //
  //
  Future<List> getPopularList() async {
    final apiResponse = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=$API_KEY"));
    Map<String, dynamic> bodyJson = await jsonDecode(apiResponse.body);

    if (apiResponse.statusCode == 200) {
      setState(() {
        popularList = bodyJson['results'];
      });
    }
    return popularList;
  }

//
//
//
  Future<List> getUpcomingList() async {
    final apiResponse = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/upcoming?api_key=$API_KEY"));
    Map<String, dynamic> bodyJson = await jsonDecode(apiResponse.body);

    if (apiResponse.statusCode == 200) {
      setState(() {
        upcomingList = bodyJson['results'];
      });
    }

    return upcomingList;
  }

//
//
//
  Future<List> getNowPlayingList() async {
    final apiResponse = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=$API_KEY"));
    Map<String, dynamic> bodyJson = await jsonDecode(apiResponse.body);
    if (apiResponse.statusCode == 200) {
      setState(() {
        nowPlayingList = bodyJson['results'];
      });
    }

    return nowPlayingList;
  }
//
//
//
}
