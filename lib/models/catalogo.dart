/*Se declara la clase Producto, que contiene las características que cada uno de los productos
  que estarán disponibles y se mostrarán en el catálogo */

class CatalogoModelo {
  static final catalogoModelo = CatalogoModelo._internal();

  CatalogoModelo._internal();

  factory CatalogoModelo() => catalogoModelo;

  static List<Producto> items = [];

  //Get Item by ID
  Producto getByID(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //Get Item by position
  Producto getByPosition(int position) => items[position];
}

class Producto {
  final int id;
  final String nombre;
  final String descrip;
  final num precio;
  final String imgURL;

/*Constructor de la clase Item */

  Producto(
      {required this.id,
      required this.nombre,
      required this.descrip,
      required this.precio,
      required this.imgURL});

/* Se convierte el objeto al formato Map, que es del tipo clave-valor para poder almacenarlo en la base de datos */
  factory Producto.fromMap(Map<String, dynamic> map) {
    return Producto(
        id: map["id"],
        nombre: map["nombre"],
        descrip: map["descrip"],
        precio: map["precio"],
        imgURL: map["imgURL"]);
  }

  toMap() => {
        "id": id,
        "nombre": nombre,
        "descrip": descrip,
        "precio": precio,
        "imgURL": imgURL
      };
}
