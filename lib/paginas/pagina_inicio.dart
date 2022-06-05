//@dart=2.9

import 'package:app_catalogo/models/catalogo.dart';
import 'package:app_catalogo/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
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
      backgroundColor: MyTheme.colorFondo,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogoHeader(),
              if (CatalogoModelo.items != null &&
                  CatalogoModelo.items.isNotEmpty)
                CatalogoLista().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

/*Encabezado de la aplicacion */
class CatalogoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catálogo - Green House"
            .text
            .xl3
            .bold
            .color(MyTheme.verdeTitulo)
            .make(),
        "Productos más populares"
            .text
            .xl2
            .bold
            .color(MyTheme.verdeSubtitulo)
            .make(),
      ],
    );
  }
}

/*Clase para construir la lista de productos*/
class CatalogoLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogoModelo.items.length,
        itemBuilder: (context, index) {
          final catalogo = CatalogoModelo.items[index];
          return CatalogoItem(catalogo: catalogo);
        });
  }
}

/* Widget para crear la lista deslizable de productos */
class CatalogoItem extends StatelessWidget {
  final Producto catalogo;

  const CatalogoItem({Key key, @required this.catalogo})
      : assert(catalogo != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogoImagen(
            imagen: catalogo.imgURL,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalogo.nombre.text.xl.color(MyTheme.verdeTitulo).bold.make(),
              catalogo.descrip.text.textStyle(context.captionStyle).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalogo.precio}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      )),
                      child: "Comprar".text.make())
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(MyTheme.colorTarjeta).rounded.square(150).make().p8();
  }
}

/*Clase donde se construye el formato de la imagen de los productos */
class CatalogoImagen extends StatelessWidget {
  final String imagen;

  const CatalogoImagen({Key key, @required this.imagen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(imagen).box.p8.make().p12();
  }
}
