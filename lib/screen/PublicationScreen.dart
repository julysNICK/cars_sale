import 'package:cars_sale/class/Car.dart';
import 'package:cars_sale/components/CardCar.dart';
import 'package:flutter/material.dart';

class PublicationScreen extends StatefulWidget {
  const PublicationScreen({super.key});

  @override
  State<PublicationScreen> createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  List<Car> cars = [
    Car(
        id: '1',
        descriptionCar: 'This is a description',
        color: 'Red',
        image:
            'https://s2.glbimg.com/JVJLdKWQSMJLYLv2zjMa47mnqb4=/0x0:2048x1366/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2022/Z/V/GuFjgdRA6onQKmmjuH9g/kwid-intense-04.jpg',
        isSold: 'false',
        make: 'Toyota',
        model: 'Corolla',
        price: '10000',
        reasonToSell: 'I need money',
        user_id: '1',
        year: '2010',
        userEmail: 'teste@nix.com'),
    Car(
        id: '2',
        descriptionCar: 'This is a description',
        color: 'Red',
        image:
            'https://s2.glbimg.com/JVJLdKWQSMJLYLv2zjMa47mnqb4=/0x0:2048x1366/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2022/Z/V/GuFjgdRA6onQKmmjuH9g/kwid-intense-04.jpg',
        isSold: 'false',
        make: 'Toyota',
        model: 'Corolla',
        price: '10000',
        reasonToSell: 'I need money',
        user_id: '1',
        year: '2010',
        userEmail: 'teste@nix.com'),
    Car(
        id: '3',
        descriptionCar: 'This is a description',
        color: 'Red',
        image:
            'https://s2.glbimg.com/JVJLdKWQSMJLYLv2zjMa47mnqb4=/0x0:2048x1366/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2022/Z/V/GuFjgdRA6onQKmmjuH9g/kwid-intense-04.jpg',
        isSold: 'false',
        make: 'Toyota',
        model: 'Corolla',
        price: '10000',
        reasonToSell: 'I need money',
        user_id: '1',
        year: '2010',
        userEmail: 'teste@nix.com'),
    Car(
        id: '3',
        descriptionCar: 'This is a description',
        color: 'Red',
        image:
            'https://s2.glbimg.com/JVJLdKWQSMJLYLv2zjMa47mnqb4=/0x0:2048x1366/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2022/Z/V/GuFjgdRA6onQKmmjuH9g/kwid-intense-04.jpg',
        isSold: 'false',
        make: 'Toyota',
        model: 'Corolla',
        price: '10000',
        reasonToSell: 'I need money',
        user_id: '1',
        year: '2010',
        userEmail: 'teste@nix.com'),
    Car(
        id: '3',
        descriptionCar: 'This is a description',
        color: 'Red',
        image:
            'https://s2.glbimg.com/JVJLdKWQSMJLYLv2zjMa47mnqb4=/0x0:2048x1366/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2022/Z/V/GuFjgdRA6onQKmmjuH9g/kwid-intense-04.jpg',
        isSold: 'false',
        make: 'Toyota',
        model: 'Corolla',
        price: '10000',
        reasonToSell: 'I need money',
        user_id: '1',
        year: '2010',
        userEmail: 'teste@nix.com'),
    Car(
        id: '3',
        descriptionCar: 'This is a description',
        color: 'Red',
        image:
            'https://s2.glbimg.com/JVJLdKWQSMJLYLv2zjMa47mnqb4=/0x0:2048x1366/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2022/Z/V/GuFjgdRA6onQKmmjuH9g/kwid-intense-04.jpg',
        isSold: 'false',
        make: 'Toyota',
        model: 'Corolla',
        price: '10000',
        reasonToSell: 'I need money',
        user_id: '1',
        year: '2010',
        userEmail: 'teste@nix.com'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              final car = cars[index];
              return Card(
                  child: CardCar(
                car: car,
                isButtonVisible: false,
              ));
            }, childCount: cars.length)),
          ),
        ],
      ),
    );
  }
}
