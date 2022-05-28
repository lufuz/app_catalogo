import 'package:app_catalogo/paginas/login.dart';
import 'package:app_catalogo/paginas/pagina_inicio.dart';
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
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/": (context) => Login(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => Login(),
      },
    );
  }
}
