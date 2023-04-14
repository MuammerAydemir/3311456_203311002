import 'package:flutter/material.dart';
import 'package:meal/pages/about.dart';
import 'package:meal/pages/details.dart';
import 'package:meal/pages/favorites.dart';
import 'package:meal/pages/homePage.dart';
import 'package:meal/pages/materials.dart';
import 'package:meal/pages/profile.dart';
import 'package:meal/pages/search.dart';
import 'package:meal/pages/sign_in.dart';
import 'package:meal/pages/sign_up.dart';
import 'package:meal/pages/totalCalories.dart';
import 'package:meal/data/Colors.dart';
import 'package:meal/navigationBar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal',
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: main1Color)),
      // themeMode: ThemeMode.system,
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => const BarNavigation(),
        //"/": (context) => const Sign_in(),
        "/HomeP":(context) => HomePage(title: "Meal"),
        "/Favorite":(context) => const Favorites(),
        "/Search":(context) => Search(),
        "/About":(context) => About(),
        "/Sign_up":(context) => Sign_up(),
        "/Profile":(context) => Profile(),
        "/Detail":(context) => const Details(),
        "/Materials":(context) => const Materials(),
        "/TotalCalories":(context) => const Total_Calories(),
        "/BarNavigation":(context) => const BarNavigation(),
      },
    );
  }
}


