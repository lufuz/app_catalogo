//@dart=2.9
import 'package:app_catalogo/db.dart';
import 'package:app_catalogo/models/catalogo.dart';
import 'package:app_catalogo/utils/routes.dart';
import 'package:app_catalogo/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalogo_lista.dart';
import '../widgets/home_widgets/catologo_header.dart';

/*Se construye un StatefulWidget, el cual se usa para dos cosas:
1. Los datos utilizados por el widget pueden cambiar
2. Los datos no pueden ser leidos a la par que se construye el widget */

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Producto> _productos = [];

  @override
  /* Este metodo es de la clase State y solo se llama una vez cuando requerimos
  de inicializar los datos */
  void initState() {
    super.initState();
    cargarProductos();
  }

/* Metodo que permite acceder al archivo json. La informacion que contiene
   se procesa para poder mostrarlo como una lista de objetos */
  cargarProductos() async {
    var catalogojson =
        await rootBundle.loadString("assets/files/catalogo.json");
    var infoDecodificada = jsonDecode(catalogojson);
    var productsInfo = infoDecodificada["productos"];
    CatalogoModelo.items = List.from(productsInfo)
        .map<Producto>((producto) => Producto.fromMap(producto))
        .toList();
    /*Este metodo se utiliza para notificar al framework que los datos han
    cambiado y se necesita actualizar la vista*/
    setState(() {});
  }

//Elementos principales de la interfaz, barra superior y se muestra el catalogo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.colorFondo,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogoHeader(),
              if (CatalogoModelo.items != null &&
                  CatalogoModelo.items.isNotEmpty)
                CatalogoLista().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
