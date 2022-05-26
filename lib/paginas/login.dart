import 'package:app_catalogo/utils/routes.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
  }

  class _LoginState extends State<Login>{
    bool changeButton= false;

    @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/green_login.png",
              fit: BoxFit.cover,             
            ),
            Text(
              "Inicio de sesión",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Ingrese su correo electrónico",
                      labelText: "Correo electrónico",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Ingrese su correo contraseña",
                      labelText: "Contraseña",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap:() async{
                      setState(() {
                        changeButton=true;
                      });

                      await Future.delayed(Duration (seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child:AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton? 50: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                      ?Icon(
                        Icons.done,
                        color:Colors.white,
                        )
                       :Text(
                      "Login",
                      style:TextStyle(color: Colors.white, 
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: 
                        BorderRadius.circular(changeButton? 50: 8),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   child: Text("Iniciar sesión"),
                  //   style: TextButton.styleFrom(minimumSize:Size(150, 40)),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  // )
                ],
              ),
            )
          ],
        )));
  }
}
