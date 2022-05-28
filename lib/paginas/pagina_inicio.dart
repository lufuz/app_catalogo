import 'package:app_catalogo/models/catalogo.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Green House";
  @override
  Widget build(BuildContext context) {
    //Lista para poder ejemplificar como se verian todos los productos
    final lista = List.generate(5, (index) => CatalogoModelo.items[0]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Catálogo - Green House",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: lista[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
