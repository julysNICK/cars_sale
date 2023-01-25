import 'package:flutter/material.dart';

class CardCar extends StatelessWidget {
  final dynamic car;

  final bool isButtonVisible;
  const CardCar({super.key, this.car, this.isButtonVisible = true});
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

  Widget _buildButton(BuildContext context,
      {String TextName = 'Fazer Proposta'}) {
    return TextButton(
      onPressed: () {
        _showDialog(context);
      },
      child: Text(
        TextName,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  _buildButtonVisibility(BuildContext context) {
    if (isButtonVisible) {
      return _buildButton(context);
    } else {
      return _buildButton(context, TextName: 'Apagar');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(car['CarsInfo']['Car']['image']);

    return GestureDetector(
      onTap: () {
        print('Card tapped');
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                car['CarsInfo']['Car']['image'] ?? '',
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
                      car['CarsInfo']['Car']['model'].toString(),
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
                      car['CarsInfo']['Car']['year'].toString(),
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
                      'R\$ ${car['CarsInfo']['Car']['price']},00',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              _buildButtonVisibility(context),
            ],
          )
        ],
      ),
    );
  }
}
