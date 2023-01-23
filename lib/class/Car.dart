class Car {
  final String? id;
  final String? descriptionCar;
  final String? color;
  final String? image;
  final String? isSold;
  final String? make;
  final String? model;
  final String? price;
  final String? reasonToSell;
  final String? user_id;
  final String? year;
  final String? userEmail;
  final String? userFirstName;
  final String? userLastName;

  Car({
    this.id,
    this.descriptionCar,
    this.color,
    this.image,
    this.isSold,
    this.make,
    this.model,
    this.price,
    this.reasonToSell,
    this.user_id,
    this.year,
    this.userEmail,
    this.userFirstName,
    this.userLastName,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['CarsInfo']['id'],
      descriptionCar: json['CarsInfo']['descriptionCar'],
      color: json['CarsInfo']['color'],
      image: json['CarsInfo']['image'],
      isSold: json['CarsInfo']['isSold'],
      make: json['CarsInfo']['make'],
      model: json['CarsInfo']['model'],
      price: json['CarsInfo']['price'],
      reasonToSell: json['CarsInfo']['reasonToSell'],
      user_id: json['CarsInfo']['user_id'],
      year: json['CarsInfo']['year'],
      userEmail: json['User']['email'],
      userFirstName: json['User']['firstName'],
      userLastName: json['User']['lastName'],
    );
  }

  String? get getId => id;
  String? get getDescriptionCar => descriptionCar;
  String? get getColor => color;
  String? get getImage => image;
  String? get getIsSold => isSold;
  String? get getMake => make;
  String? get getModel => model;
  String? get getPrice => price;
  String? get getReasonToSell => reasonToSell;
  String? get getUserId => user_id;
  String? get getYear => year;
  String? get getUserEmail => userEmail;
  String? get getUserFirstName => userFirstName;
  String? get getUserLastName => userLastName;
}
