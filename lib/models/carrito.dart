// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:app_catalogo/core/tienda.dart';
import 'package:app_catalogo/models/catalogo.dart';

/*Se declara la clase Carrito, que contiene las características que cada uno de los productos
  que se seleccionan y se mostrarán en el catálogo */

class CarritoModelo {
  late CatalogoModelo _catalogo;

  //coleccion de id's = tienda.id's de cada producto
  final List<int> _itemIDs = [];

  //Se obtiene el catalogo
  CatalogoModelo get catalog => _catalogo;

  set catalog(CatalogoModelo newCatalog) {
    assert(newCatalog != null);
    _catalogo = newCatalog;
  }

  //se obtienen los objetos en el carrito
  List<Producto> get productos =>
      _itemIDs.map((id) => _catalogo.getByID(id)).toList();

  //se obtiene el precio total del carrito
  num get precioTotal =>
      productos.fold(0, (total, current) => total + current.precio);
}

class AddMutation extends VxMutation<MyTienda> {
  final Producto producto;

  AddMutation(this.producto);
  @override
  perform() {
    store.carrito._itemIDs.add(producto.id);
  }
}

class RemoveMutation extends VxMutation<MyTienda> {
  final Producto producto;

  RemoveMutation(this.producto);
  @override
  perform() {
    store.carrito._itemIDs.remove(producto.id);
  }
}
