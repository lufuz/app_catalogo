import 'package:app_catalogo/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

/* Clase donde se contruyen los elementos de la pagina del
carrito de compras, donde se despliegan los productos seleccionados */

class PaginaCarrito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.colorFondo,
      appBar: AppBar(
        title: "Carrito".text.make(),
      ),
    );
  }
}
