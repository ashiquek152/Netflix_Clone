import 'package:flutter/material.dart';
import 'package:netflix_tmdb/widgets/colors.dart';
import 'package:netflix_tmdb/screens/screen_search.dart';
import 'package:netflix_tmdb/widgets/icon_widget.dart';
import 'package:netflix_tmdb/widgets/text_widget.dart';
import 'package:netflix_tmdb/widgets/scrollable_show_list.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMoviesFetched = [];
  List topRatedMoviesFetched = [];
  List tvShowsFetched = [];
  List nowPlayingMovies = [];
  // final internetCheck= InternetCheck();

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // internetCheck.checkConnection();
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: size.height - 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 500,
                          decoration: const BoxDecoration(
                              color: red,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/HomeBanner.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          height: 500,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                black.withOpacity(0.85),
                                black.withOpacity(0),
                              ],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter)),
                        ),
                        SizedBox(
                          height: 500,
                          width: size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/images/banner_titile.png",
                                width: 300,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              // Textwidget(
                              //     text:
                              //         "Exciting-Sci-Fi Drama - Sci-Fi Adventure",
                              //     color: white,
                              //     fontsize: 11)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const IconWidget(
                                icon: Icons.add,
                                iconColor: white,
                                iconSize: 25),
                            const SizedBox(
                              height: 5,
                            ),
                            Textwidget(
                                text: "My List", color: white, fontsize: 12)
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 2, 13, 2),
                            child: Row(
                              children: [
                                const IconWidget(
                                    icon: Icons.play_arrow,
                                    iconColor: black,
                                    iconSize: 30),
                                const SizedBox(
                                  width: 5,
                                ),
                                Textwidget(
                                    text: "Play", color: black, fontsize: 16)
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const IconWidget(
                                icon: Icons.info_outline,
                                iconColor: white,
                                iconSize: 25),
                            const SizedBox(
                              height: 5,
                            ),
                            Textwidget(text: "Info", color: white, fontsize: 12)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ScrollableRowList(
                          header: "Top rated",
                          list: topRatedMoviesFetched,
                          height: 110,
                          width: 160,
                        ),
                        ScrollableRowList(
                          header: "Trending Now",
                          list: trendingMoviesFetched,
                          height: 110,
                          width: 160,
                        ),

                        ScrollableRowList(
                          header: "Tv Shows",
                          list: tvShowsFetched,
                          height: 110,
                          width: 160,
                        ),
                        ScrollableRowList(
                          header: "Now Playing",
                          list: nowPlayingMovies,
                          height: 165,
                          width: 300,
                        ),
                        // const ScrollableRowList(
                        //   header: "Anime",
                        //   list: animeList,
                        //   height: 110,
                        //   width: 160,
                        // )
                      ],
                    )
                  ],
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 30),
                          child: Image.asset(
                            "assets/images/logo.ico",
                            fit: BoxFit.cover,
                            width: 35,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 35),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const IconWidget(
                                      icon: Icons.collections_bookmark,
                                      iconColor: white,
                                      iconSize: 35)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/images/profile.jpeg",
                                    width: 26,
                                    height: 26,
                                    fit: BoxFit.cover,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Textwidget(
                          text: "Tv Shows",
                          color: white,
                          fontsize: 15,
                        ),
                        Textwidget(
                          text: "Movies",
                          color: white,
                          fontsize: 15,
                        ),
                        Row(
                          children: [
                            Textwidget(
                              text: "Categories",
                              color: white,
                              fontsize: 15,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const IconWidget(
                                icon: Icons.keyboard_arrow_down,
                                iconColor: white,
                                iconSize: 18)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
  //
  //
  loadMovies() async {
    TMDB tmdbWithCustomlogs = TMDB(ApiKeys(API_KEY, ACCESS_TOKEN),
        logConfig: const ConfigLogger(showErrorLogs: true, showLogs: true));
    Map trendingMoviesResults =
        await tmdbWithCustomlogs.v3.trending.getTrending();
    Map topRatedMoviesResults =
        await tmdbWithCustomlogs.v3.movies.getTopRated();
    Map tvShowsResults = await tmdbWithCustomlogs.v3.tv.getPopular();
    Map nowPlayingResults = await tmdbWithCustomlogs.v3.movies.getNowPlaying();

    setState(() {
      trendingMoviesFetched = trendingMoviesResults['results'];
      topRatedMoviesFetched = topRatedMoviesResults['results'];
      tvShowsFetched = tvShowsResults['results'];
      nowPlayingMovies = nowPlayingResults['results'];
      // print(tvShowsResults);
    });
  }
//
//
//

}
