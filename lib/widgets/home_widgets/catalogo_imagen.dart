/*Clase donde se construye el formato de la imagen de los productos */
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:app_catalogo/widgets/themes.dart';

class CatalogoImagen extends StatelessWidget {
  final String imagen;

  const CatalogoImagen({Key? key, required this.imagen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(imagen).box.p8.make().p12();
  }
}
