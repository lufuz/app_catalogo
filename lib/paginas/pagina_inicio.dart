import 'package:app_catalogo/models/catalogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

/*Se construye un StatefulWidget, el cual se usa para dos cosas:
1. Los datos utilizados por el widget pueden cambiar
2. Los datos no pueden ser leidos a la par que se construye el widget */

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Green House";

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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final producto = CatalogoModelo.items[index];
            return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: GridTile(
                  header: Container(
                    child: Text(
                      producto.nombre,
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen.shade300,
                    ),
                  ),
                  child: Image.network(
                    producto.imgURL,
                  ),
                  footer: Container(
                    child: Text(
                      producto.precio.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen.shade300,
                    ),
                  ),
                ));
          },
          itemCount: CatalogoModelo.items.length,
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
