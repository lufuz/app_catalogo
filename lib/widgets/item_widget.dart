import 'package:flutter/material.dart';
import '../models/catalogo.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: StadiumBorder(),
      //color: Colors.lightGreen.shade400,
      child: ListTile(
        minVerticalPadding: 2.5,
        onTap: () {
          print("${item.nombre} presionado");
        },
        leading: Image.network(item.imgURL),
        title: Text(item.nombre),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price.toString()}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.lightGreen.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
