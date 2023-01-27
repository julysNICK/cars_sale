import 'package:cars_sale/controllers/auth_controller.dart';
import 'package:cars_sale/controllers/cars_controller.dart';
import 'package:cars_sale/screen/AddCar.dart';
import 'package:cars_sale/screen/ListCarScreen.dart';
import 'package:cars_sale/screen/PublicationScreen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItemBottom = 0;
  AuthController authController = AuthController();
  CarsController carsController = CarsController();

  @override
  onTapItem(int index) {
    setState(() {
      _selectedItemBottom = index;
    });
  }

  final _screens = [
    const ListCarScreen(),
    const AddCar(),
    const PublicationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: _screens[_selectedItemBottom],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 0,
          currentIndex: _selectedItemBottom,
          onTap: onTapItem,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                size: 40,
              ),
              label: 'Adicionar carro',
              tooltip: 'Adicionar carro',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.garage,
              ),
              label: 'My publication',
            ),
          ],
        ),
      ),
    );
  }
}
