import 'package:cars_sale/controllers/auth_controller.dart';
import 'package:cars_sale/screen/LoginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  var currentScreen = const LoginScreen();
  AuthController authController = AuthController();

  runApp(const MaterialApp(
    home: LoginScreen(),
  ));
}
