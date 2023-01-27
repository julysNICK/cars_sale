import 'dart:convert';

import 'package:cars_sale/class/CarInfo.dart';
import 'package:cars_sale/controllers/auth_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class CarsController {
  final String _url = 'http://192.168.0.69:8080/api/v1/';
  AuthController authController = AuthController();
  List<CarInfo1>? carsResult = [];
  TextEditingController controllerInputMake = TextEditingController();
  TextEditingController controllerInputModel = TextEditingController();
  TextEditingController controllerInputYear = TextEditingController();
  TextEditingController controllerInputPrice = TextEditingController();
  TextEditingController controllerInputReasonToSell = TextEditingController();
  TextEditingController controllerInputImage = TextEditingController();

  bool _verifyEmptyFields() {
    if (controllerInputMake.text.isEmpty ||
        controllerInputModel.text.isEmpty ||
        controllerInputYear.text.isEmpty ||
        controllerInputPrice.text.isEmpty ||
        controllerInputReasonToSell.text.isEmpty ||
        controllerInputImage.text.isEmpty) {
      return true;
    }
    return false;
  }

  num _convertStringToNum(String value) {
    return num.parse(value);
  }

  void clearFields() {
    controllerInputMake.clear();
    controllerInputModel.clear();
    controllerInputYear.clear();
    controllerInputPrice.clear();
    controllerInputReasonToSell.clear();
    controllerInputImage.clear();
  }

  Future getCars() async {
    try {
      var response = await http.get(Uri.parse('${_url}cars'));
      if (response.statusCode == 200) {
        carsResult = (json.decode(response.body) as List)
            .map((e) => CarInfo1.fromJson(e))
            .toList();
        return carsResult;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future _renewToken(String token) async {
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "Bearer $token"
      };
      var response =
          await http.post(Uri.parse('${_url}refresh'), headers: headers);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data['token'];
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future getCarId(String id) async {
    try {
      var response = await http.get(Uri.parse('${_url}cars/$id'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future getMyCars() async {
    try {
      String? token = await authController.getToken();
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "Bearer $token"
      };

      var response =
          await http.get(Uri.parse('$_url/cars/my'), headers: headers);
      if (response.statusCode == 200) {
        carsResult = (json.decode(response.body)['Cars'] as List).map((e) {
          return CarInfo1.fromJsonOnlyCar(e);
        }).toList();

        return carsResult;
      } else if (response.statusCode == 401) {
        var newToken = await _renewToken(token!);
        authController.saveToken(newToken);

        if (!newToken.isEmpty) {
          return getMyCars();
        }

        return;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future AddCar() async {
    if (_verifyEmptyFields()) {
      print("Preencha todos os campos");
      return;
    }

    try {
      String? token = await authController.getToken();
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "Bearer $token"
      };
      var response = await http.post(Uri.parse('${_url}car'),
          body: jsonEncode({
            "make": controllerInputMake.text,
            "model": controllerInputModel.text,
            "year": controllerInputYear.text,
            "price": _convertStringToNum(controllerInputPrice.text),
            "reasonToSell": controllerInputReasonToSell.text,
            "image": controllerInputImage.text,
            "isSold": false,
            "color": "red"
          }),
          headers: headers);

      if (response.statusCode == 201) {
        clearFields();
      } else if (response.statusCode == 401) {
        var newToken = await _renewToken(token!);
        authController.saveToken(newToken);

        if (!newToken.isEmpty) {
          return getMyCars();
        }

        return;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
