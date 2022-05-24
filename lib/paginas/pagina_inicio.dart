import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Green House";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catálogo - Green House"),
      ),
      body: Center(
        child: Container(
          child: Text("Bienvenido la pagina $days de Flutter para $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
