import 'package:cars_sale/screen/ListCarScreen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItemBottom = 0;

  onTapItem(int index) {
    setState(() {
      _selectedItemBottom = index;
    });
  }

  final _screens = [
    const ListCarScreen(),
    const Center(child: Text('Search')),
    const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: _screens[_selectedItemBottom],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedItemBottom,
          onTap: onTapItem,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
