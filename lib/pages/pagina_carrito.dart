import 'package:app_catalogo/models/carrito.dart';
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
          _CarritoLista().p32().expand(),
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
    final _carrito = CarritoModelo();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_carrito.precioTotal}".text.xl3.bold.make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Compra aun no habilitada.".text.make(),
              ));
            },
            child: "Comprar".text.xl3.make(),
          ).w40(context)
        ],
      ),
    );
  }
}

class _CarritoLista extends StatefulWidget {
  @override
  _CarritoListaState createState() => _CarritoListaState();
}

class _CarritoListaState extends State<_CarritoLista> {
  final _carrito = CarritoModelo();
  @override
  Widget build(BuildContext context) {
    return _carrito.productos.isEmpty
        ? "Agrega productos al carrito".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _carrito.productos.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  _carrito.eliminar(_carrito.productos[index]);
                  setState(() {});
                },
              ),
              title: _carrito.productos[index].nombre.text.make(),
            ),
          );
  }
}
