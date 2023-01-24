import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthController {
  final storage = const FlutterSecureStorage();
  TextEditingController controllerInputEmail = TextEditingController();
  TextEditingController controllerInputPassword = TextEditingController();
  TextEditingController controllerInputFirstName = TextEditingController();
  TextEditingController controllerInputLastName = TextEditingController();
  TextEditingController controllerInputConfirmPassword =
      TextEditingController();
  bool remenberMe = false;

  bool verifyMatchPassword() {
    if (controllerInputPassword.text == controllerInputConfirmPassword.text) {
      return true;
    }
    return false;
  }

  _navigateToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  verifyUserLogged(context, screeName) async {
    var token = await storage.read(key: "token");
    if (token != null) {
      return;
    }
    return _navigateToPage(context, screeName);
  }

  Future _saveToken(token, context, screeName) async {
    await storage
        .write(key: 'token', value: token)
        .then((value) => {_navigateToPage(context, screeName)});
  }

  Future loginUser(context, screeName) async {
    const apiUrl = "http://192.168.0.69:8080/api/v1/login";

    var response = await http.post(Uri.parse(apiUrl),
        body: jsonEncode({
          "email": controllerInputEmail.text,
          "password": controllerInputPassword.text
        }));

    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body);
      await _saveToken(loginArr['token'], context, screeName);
    } else {
      print(response.statusCode);
    }
  }

  Future registerUser() async {
    const apiUrl = "http://192.168.0.69:8080/api/v1/register";
    if (verifyMatchPassword()) {
      var response = await http.post(Uri.parse(apiUrl),
          body: jsonEncode({
            "email": controllerInputEmail.text,
            'firstName': controllerInputFirstName.text,
            'lastName': controllerInputLastName.text,
            "password": controllerInputPassword.text
          }));

      if (response.statusCode != 200) {
        print(response.statusCode);
      }
    }
    return;
  }

  Future<String?> getToken() async {
    var token = await storage.read(key: "token");

    return token;
  }
}
