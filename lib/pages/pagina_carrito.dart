import 'package:app_catalogo/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
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
      body: Column(
        children: [
          _CartLista().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl3.bold.make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {},
            child: "Comprar".text.xl3.make(),
          ).w40(context)
        ],
      ),
    );
  }
}

class _CartLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {},
        ),
        title: "Producto 1".text.make(),
      ),
    );
  }
}
