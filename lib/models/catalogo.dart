/*Se declara la clase Item, que contiene las características que cada uno de los productos
  que estarán disponibles y se mostrarán en el catálogo */

class CatalogoModelo {
  static List<Producto> items = [
    Producto(
        id: 1,
        nombre: "Maceta Viena Chocolate",
        descrip:
            "2 macetas plásticas de 16 pulgadas de diámetro. Color chocolate.",
        precio: 189,
        imgURL: "https://cdn.homedepot.com.mx/productos/102050/102050-d.jpg")
  ];
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
