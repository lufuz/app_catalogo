import 'package:app_catalogo/widgets/home_widgets/catalogo_lista.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:app_catalogo/models/carrito.dart';
import 'package:app_catalogo/models/catalogo.dart';

class MyTienda extends VxStore {
  late CatalogoModelo catalogo;
  late CarritoModelo carrito;

  MyTienda() {
    catalogo = CatalogoModelo();
    carrito = CarritoModelo();
    carrito.catalog = catalogo;
  }
}
