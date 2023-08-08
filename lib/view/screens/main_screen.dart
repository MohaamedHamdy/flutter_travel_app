import 'package:flutter/material.dart';
import 'package:travel_app/view/screens/nav_bar_pages/bar_chart.dart';
import 'package:travel_app/view/screens/nav_bar_pages/home_screen.dart';
import 'package:travel_app/view/screens/nav_bar_pages/my_screen.dart';
import 'package:travel_app/view/screens/nav_bar_pages/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List screens = [HomeScreen(), BarChartScreen(), SearchScreen(), MyScreen()];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade400,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            label: 'bar Item',
            icon: Icon(Icons.bar_chart_sharp),
          ),
          BottomNavigationBarItem(
            label: 'search',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'My profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
