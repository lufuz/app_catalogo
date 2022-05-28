class CatalogoModelo {
  static final items = [
    Item(
        id: 1,
        nombre: "Maceta Viena Chocolate",
        desc:
            "2 macetas plásticas de 16 pulgadas de diámetro. Color chocolate.",
        price: 189,
        imgURL: "https://cdn.homedepot.com.mx/productos/102050/102050-d.jpg")
  ];
}

class Item {
  final int id;
  final String nombre;
  final String desc;
  final num price;
  final String imgURL;

  Item(
      {required this.id,
      required this.nombre,
      required this.desc,
      required this.price,
      required this.imgURL});
}
