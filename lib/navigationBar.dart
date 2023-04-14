import 'package:flutter/material.dart';
import 'package:meal/pages/homePage.dart';
import 'package:meal/pages/favorites.dart';
import 'package:meal/pages/search.dart';
import 'package:meal/data/Colors.dart';
class BarNavigation extends StatefulWidget {

  const BarNavigation({Key? key}) : super(key: key);

  @override
  State<BarNavigation> createState() => _BarNavigatinState();
}

class _BarNavigatinState extends State<BarNavigation> {

  List pages=[Search(),HomePage(title: "Meal"),const Favorites()];
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: main1Color,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
        ],
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: black,
        selectedItemColor: main2Color,
        onTap: _onItemTapped,
        iconSize: 35,
      ),
    );
  }
}
