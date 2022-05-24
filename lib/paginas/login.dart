import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          "Inicio de sesión",
          style: TextStyle(
            fontSize: 30,
            color: Colors.lightGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
