import 'package:app_catalogo/pages/login.dart';
import 'package:app_catalogo/pages/pagina_carrito.dart';
import 'package:app_catalogo/pages/pagina_inicio.dart';
import 'package:app_catalogo/utils/routes.dart';
import 'package:app_catalogo/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* ThemeMode ayuda a personalizar elementos de la interfaz, dependiendo los atributos otorgados al tema oscuro y claro;
       esto se basa en las preferencias del usuario (que tema tiene en su dispositivo*/
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      //Se declara la ruta de inicio, es decir, la interfaz que se mostrará al ejecutar la aplicación, así como las demás rutas disponibles para navegar por la app
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => Login(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.cartRoute: (context) => PaginaCarrito(),
      },
    );
  }
}
