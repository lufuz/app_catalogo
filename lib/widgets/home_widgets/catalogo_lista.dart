/*Clase para construir la lista de productos*/
import 'package:app_catalogo/pages/pagina_inicio_detalles.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:app_catalogo/widgets/themes.dart';
import '../../models/catalogo.dart';
import 'catalogo_imagen.dart';

class CatalogoLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogoModelo.items.length,
        itemBuilder: (context, index) {
          final catalogo = CatalogoModelo.items[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailsPage(
                  catalogo: catalogo,
                ),
              ),
            ),
            child: CatalogoItem(catalogo: catalogo),
          );
        });
  }
}

/* Widget para crear la lista deslizable de productos */
class CatalogoItem extends StatelessWidget {
  final Producto catalogo;

  const CatalogoItem({Key? key, required this.catalogo})
      : assert(catalogo != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalogo.id.toString()),
            child: CatalogoImagen(
              imagen: catalogo.imgURL,
            ),
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
                      child: "Añadir".text.make())
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(MyTheme.colorTarjeta).rounded.square(150).make().p8();
  }
}
