import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/carrito.dart';
import '../../models/catalogo.dart';

/*Clase donde se valida la funcion de agregar productos al carrito, para que
no se dupliquen y el boton de agregar pueda cambiar de estado*/

class AddToCarrito extends StatefulWidget {
  final Producto catalogo;
  const AddToCarrito({Key? key, required this.catalogo}) : super(key: key);

  @override
  State<AddToCarrito> createState() => _AddToCarritoState();
}

class _AddToCarritoState extends State<AddToCarrito> {
  final _carrito = CarritoModelo();

  @override
  Widget build(BuildContext context) {
    bool estaEnCarrito = _carrito.productos.contains(widget.catalogo) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!estaEnCarrito) {
          estaEnCarrito = estaEnCarrito.toggle();
          final _catalogo = CatalogoModelo();
          _carrito.catalog = _catalogo;
          _carrito.agregar(widget.catalogo);
          setState(() {});
        }
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
        StadiumBorder(),
      )),
      child: estaEnCarrito
          ? Icon(Icons.done)
          : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
