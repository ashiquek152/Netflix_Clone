import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:netflix_tmdb/functions/check_connectivity.dart';
import 'package:netflix_tmdb/functions/json_function.dart';
import 'package:netflix_tmdb/screens/error_screen.dart';
import 'package:netflix_tmdb/widgets/colors.dart';
import 'package:netflix_tmdb/screens/navigation_bar.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final internetCheck = InternetCheck();
  internetCheck.checkConnection();
  getMoives();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // bottomAppBarColor: white,
            primaryColor: Colors.white),
        home:connected == true ?
         const BottomNavigation() : 
        const ErrorScreen());
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: FooterBar(),
    );
  }
}
