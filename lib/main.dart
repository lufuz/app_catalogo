import 'package:app_catalogo/paginas/login.dart';
import 'package:app_catalogo/paginas/pagina_inicio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => Login(),
        "/home": (context) => HomePage(),
        "/login": (context) => Login(),
      },
    );
  }
}
