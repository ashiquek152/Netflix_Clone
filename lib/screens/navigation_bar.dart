import 'package:flutter/material.dart';
import 'package:netflix_tmdb/widgets/colors.dart';
import 'package:netflix_tmdb/screens/screen_search.dart';
import 'package:netflix_tmdb/screens/downloads.dart';
import 'package:netflix_tmdb/screens/homescreen.dart';
import 'package:netflix_tmdb/screens/screen_comingsoon.dart';
import 'package:netflix_tmdb/widgets/icon_widget.dart';
import 'package:netflix_tmdb/widgets/text_widget.dart';

class FooterBar extends StatefulWidget {
  const FooterBar({Key? key}) : super(key: key);

  @override
  State<FooterBar> createState() => _FooterBarState();
}

class _FooterBarState extends State<FooterBar> {
  final pages = [
    const Home(),
    const ScreenComingsoon(),
    const ScreenSearch(),
    const Downloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedItem],
      backgroundColor: black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedItem,
        onTap: (newIndex) {
          setState(() {
            selectedItem = newIndex;
          });
        },
        unselectedItemColor: white,
        selectedItemColor: red,
        backgroundColor: black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: IconWidget(
              icon: Icons.home,
              iconColor: white,
              iconSize: 30,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: IconWidget(
              icon: Icons.play_circle_outline_sharp,
              iconColor: white,
              iconSize: 30,
            ),
            label: 'Coming soon',
          ),
          BottomNavigationBarItem(
            backgroundColor: white,
            icon: IconWidget(
                icon: Icons.search,
                iconColor: white,
                iconSize: 30),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: IconWidget(
                icon: Icons.download_for_offline_rounded,
                iconColor: white,
                iconSize: 30),
            label: 'Downloads',
          ),
        ],
      ),
    );
  }
}
