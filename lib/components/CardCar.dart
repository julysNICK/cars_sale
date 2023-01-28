import 'package:cars_sale/class/CarInfo.dart';
import 'package:cars_sale/controllers/cars_controller.dart';
import 'package:flutter/material.dart';

class CardCar extends StatelessWidget {
  CarInfo1 car = CarInfo1();
  CarsController carsController = CarsController();
  final bool isButtonVisible;
  final bool isDeleteButtonPopupVisible;
  CardCar(
      {super.key,
      required this.car,
      this.isButtonVisible = true,
      this.isDeleteButtonPopupVisible = false});
  Future _showDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Fazer Proposta'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Deseja fazer uma proposta para esse carro?'),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'valor',
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Confirmar'),
              ),
            ],
          );
        });
  }

  Future _showDialogDelete(BuildContext context, String id) async {
    print(id);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Apagar'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Deseja apagar esse carro?'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  carsController
                      .deleteCar(id)
                      .then((value) => Navigator.of(context).pop());
                },
                child: const Text('Confirmar'),
              ),
            ],
          );
        });
  }

  showPopupDIalogOrDelete(BuildContext context, String id) {
    if (isDeleteButtonPopupVisible) {
      _showDialogDelete(context, id);
    } else {
      _showDialog(context);
    }
  }

  Widget _buildButton(BuildContext context, String id,
      {String TextName = 'Fazer Proposta'}) {
    return TextButton(
      onPressed: () {
        showPopupDIalogOrDelete(context, id);
      },
      child: Text(
        TextName,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  _buildButtonVisibility(BuildContext context, String id) {
    if (isButtonVisible) {
      return _buildButton(context, id);
    } else {
      return _buildButton(context, TextName: 'Apagar', id);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(car.car?.image.toString());

    return GestureDetector(
      onTap: () {
        print('Card tapped');
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                car.car?.image.toString() ?? '',
                height: 220.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: Center(
                  child: Text(
                    'Ficha Técnica',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Modelo:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      car.car?.model.toString() ?? '',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ano:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      car.car?.year.toString() ?? '',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Cor:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Vermelho',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Preço:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'R\$ ${car.car?.price},00',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              _buildButtonVisibility(context, car.car?.id.toString() ?? ''),
            ],
          )
        ],
      ),
    );
  }
}
