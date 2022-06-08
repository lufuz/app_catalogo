import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/tienda.dart';
import '../../models/carrito.dart';
import '../../models/catalogo.dart';

/*Clase donde se valida la funcion de agregar productos al carrito, para que
no se dupliquen y el boton de agregar pueda cambiar de estado*/

class AddToCarrito extends StatelessWidget {
  final Producto catalogo;
  AddToCarrito({Key? key, required this.catalogo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [AddMutation, RemoveMutation]);
    final CarritoModelo _carrito = (VxState.store as MyTienda).carrito;
    bool estaEnCarrito = _carrito.productos.contains(catalogo) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!estaEnCarrito) {
          AddMutation(catalogo);
          //setState(() {});
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
