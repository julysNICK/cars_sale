import 'package:cars_sale/components/CardCar.dart';
import 'package:cars_sale/controllers/cars_controller.dart';
import 'package:flutter/material.dart';

class ListCarScreen extends StatefulWidget {
  const ListCarScreen({super.key});

  @override
  State<ListCarScreen> createState() => _ListCarScreenState();
}

class _ListCarScreenState extends State<ListCarScreen> {
  CarsController carsController = CarsController();
  List? carsInfo = [];

  @override
  void initState() {
    super.initState();
    carsController.getCars().then((value) => {
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
          padding: const EdgeInsets.all(10),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final car = carsInfo![index];
                return Card(
                    child: CardCar(
                  car: car,
                ));
              },
              childCount: carsInfo!.length,
            ),
          ),
        ),
      ],
    ));
  }
}
