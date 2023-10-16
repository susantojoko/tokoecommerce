import 'package:flutter/material.dart';
import 'package:tokoecommerce/Screens/favorite.dart';
import 'package:tokoecommerce/Screens/homepage.dart';
import 'package:tokoecommerce/Screens/notifications_page.dart';
import 'package:tokoecommerce/Screens/profile_page.dart';



class NavBarBottom extends StatefulWidget {

  @override
  State<NavBarBottom> createState() => _NavBarBottomState();
}

class _NavBarBottomState extends State<NavBarBottom> {
  List pages = [
    HomePage(),
    NotificationPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        onTap: onTap,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}