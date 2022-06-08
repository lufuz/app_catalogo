import 'package:app_catalogo/models/catalogo.dart';
import 'package:app_catalogo/widgets/home_widgets/agregar_al_carrito.dart';
import 'package:app_catalogo/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

/* Clase donde se construye la estructura de la pagina de detalles
de los diferentes productos */

class HomeDetailsPage extends StatelessWidget {
  final Producto catalogo;

  const HomeDetailsPage({Key? key, required this.catalogo})
      : assert(catalogo != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.colorFondo,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${catalogo.precio}".text.bold.xl3.make(),
          AddToCarrito(
            catalogo: catalogo,
          ).wh(100, 45),
        ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalogo.id.toString()),
                    child: Image.network(catalogo.imgURL))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: MyTheme.colorTarjeta,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalogo.nombre.text.xl3
                        .color(MyTheme.verdeTitulo)
                        .bold
                        .make(),
                    10.heightBox,
                    catalogo.descrip.text
                        .color(MyTheme.verdeSubtitulo)
                        .bold
                        .textStyle(context.captionStyle)
                        .xl2
                        .make(),
                  ],
                ).px32().py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
