class CarExample {
  final int? id;
  final String? make;
  final String? descriptionCar;
  final String? image;
  final String? model;
  final String? reasonToSell;
  final String? year;
  final bool? isSold;
  final String? color;
  final int? price;
  final int? user_id;

  CarExample({
    this.id,
    this.make,
    this.descriptionCar,
    this.image,
    this.model,
    this.reasonToSell,
    this.year,
    this.isSold,
    this.color,
    this.price,
    this.user_id,
  });

  factory CarExample.fromJson(Map<String, dynamic> json) {
    return CarExample(
      id: json['id'],
      make: json['make'],
      descriptionCar: json['descriptionCar'],
      image: json['image'],
      model: json['model'],
      reasonToSell: json['reasonToSell'],
      year: json['year'],
      isSold: json['isSold'],
      color: json['color'],
      price: json['price'],
      user_id: json['user_id'],
    );
  }
}

class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
    );
  }
}

class CarInfo1 {
  final CarExample? car;
  final List<CarExample>? cars;
  final User? user;

  CarInfo1({
    this.car,
    this.user,
    this.cars,
  });

  factory CarInfo1.fromJson(Map<String, dynamic> json) {
    return CarInfo1(
      car: CarExample.fromJson(json['CarsInfo']['Car']),
      user: User.fromJson(json['CarsInfo']['User']),
    );
  }

  factory CarInfo1.fromJsonList(dynamic json) {
    return CarInfo1(
      cars: (json['Cars'] as List).map((e) => CarExample.fromJson(e)).toList(),
    );
  }

  factory CarInfo1.fromJsonOnlyCar(Map<String, dynamic> json) {
    print(json);
    return CarInfo1(
      car: CarExample.fromJson(json),
    );
  }
}
