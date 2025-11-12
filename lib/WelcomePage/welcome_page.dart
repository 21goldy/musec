import 'package:flutter/material.dart';
import 'package:musec/FavouritesPage/favourites_page.dart';
import 'package:musec/HomePage/home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
    int _currentIndex = 0;

    final List<Widget> _screens = [
      HomePage(),
      FavouritesPage(),
      Center(child: Text("Favourite Page")),
      Center(child: Text("Profile Page")),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: _screens[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            elevation: 2,

            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },

            items: const [
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded),
                label: "Favourites",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.water_drop),
                label: "Drop Room",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Profile",
              ),
            ],
          ),
        ),
      );
    }
}
