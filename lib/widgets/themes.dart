import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*Clase que permite acceder a las propiedades de los temas para la aplicacion,
contienen los colores, fuentes e íconos necesarios */

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.lightGreen,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: AppBarTheme(
        color: Colors.lightGreen,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );

  /*Colores a utilizar */

  static Color verdeTitulo = Colors.lightGreen.shade900;
  static Color verdeSubtitulo = Colors.lightGreen.shade800;
  static Color colorFondo = Colors.green.shade50;
  static Color colorTarjeta = Colors.green.shade100;
}
