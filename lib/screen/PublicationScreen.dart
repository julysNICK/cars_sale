import 'package:cars_sale/class/CarInfo.dart';
import 'package:cars_sale/components/CardCar.dart';
import 'package:cars_sale/controllers/cars_controller.dart';
import 'package:flutter/material.dart';

class PublicationScreen extends StatefulWidget {
  const PublicationScreen({super.key});

  @override
  State<PublicationScreen> createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  CarsController carsController = CarsController();
  List<CarInfo1> carsInfo = [];

  @override
  void initState() {
    super.initState();
    carsController.getMyCars().then((value) => {
          setState(() {
            if (value != null) {
              carsInfo = value;
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              final CarInfo1 car = carsInfo[index];
              return Card(
                  child: CardCar(
                car: car,
                isButtonVisible: false,
                isDeleteButtonPopupVisible: true,
              ));
            }, childCount: carsInfo.length)),
          ),
        ],
      ),
    );
  }
}
