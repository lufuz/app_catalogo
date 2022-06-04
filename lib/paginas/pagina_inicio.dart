import 'package:app_catalogo/models/catalogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Green House";

  @override
  void initState() {
    super.initState();
    cargarProductos();
  }

  cargarProductos() async {
    var catalogojson =
        await rootBundle.loadString("assets/files/catalogo.json");
    var infoDecodificada = jsonDecode(catalogojson);
    print(infoDecodificada);
  }

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
