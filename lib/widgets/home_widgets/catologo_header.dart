/*Encabezado de la aplicacion */
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/themes.dart';

class CatalogoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catálogo - Green House"
              .text
              .xl3
              .bold
              .color(MyTheme.verdeTitulo)
              .make(),
          10.heightBox,
          "Productos más populares"
              .text
              .xl2
              .bold
              .color(MyTheme.verdeSubtitulo)
              .make(),
        ],
      ),
    );
  }
}
