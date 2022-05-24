import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Nombre aqui";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catálogo - Green House"),
      ),
      body: Center(
        child: Container(
          child: Text("Bienvenido al curso de $days de Flutter por $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
//mi papa es fox el presidente