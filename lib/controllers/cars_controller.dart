import 'dart:convert';

import 'package:http/http.dart' as http;

class CarsController {
  final String _url = 'http://192.168.0.69:8080/api/v1/';

  Future getCars() async {
    try {
      var response = await http.get(Uri.parse('${_url}cars'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
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
}
