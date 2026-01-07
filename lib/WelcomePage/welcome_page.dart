import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musec/AccountPage/account_page.dart';
import 'package:musec/DropRoomPage/drop_room_page.dart';
import 'package:musec/HomePage/home_page.dart';
import 'package:musec/SearchPage/search_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const SearchPage(),
    const DropRoomPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 60),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.elliptical(30, 50),
            bottomLeft: Radius.elliptical(70, 40),
            bottomRight: Radius.elliptical(20, 50),
            topRight: Radius.elliptical(50, 20),
          ),
          child: Container(
            height: 80,
            color: Colors.grey.shade800,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _navIcon("assets/svgs/thin_home.svg", 0, 45),
                _navIcon("assets/svgs/thin_search.svg", 1, 50),
                _navIcon("assets/svgs/thin_room.svg", 2, 40),
                _navIcon("assets/svgs/thin_account.svg", 3, 45),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navIcon(String assetPath, int index, double size) {
    final bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => _currentIndex = index);
      },
      child: SvgPicture.asset(
        assetPath,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.white : Colors.grey.shade400,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
