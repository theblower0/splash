import 'package:ejercicio0/screens/signUp.dart';
//import 'package:ejercicio0/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String nombre = "";
  final nombreController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 249, 239, 1),
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Color.fromRGBO(231, 74, 47, 1),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        //mainAxisSize: MainAxisSize.max, //lena todo el espacio vertical
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SvgPicture.asset(
                  'assets/images/authenticationIcon.svg',
                  height: 250.0,
                  width: 250.0,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Ingresa tus credenciales\n'
                  'registradas para acceder',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    letterSpacing: 0.3,
                    decoration: TextDecoration.none,
                    color: Color.fromRGBO(71, 34, 18, 1),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: TextField(
                //controller: Controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  hintText: 'Email user',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                //controller: Controller,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: TextButton(
                onPressed: () {
                  nombre = nombreController.text;
                  print("El nombre que escribiste es: $nombre");
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  backgroundColor: Color.fromRGBO(231, 74, 47, 1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 110, vertical: 20),
                ),
                child: Text(
                  'CONTINUAR',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Open Sans',
                      color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: const EdgeInsets.only(top: 60)),
                Text(
                  '¿Aun no tienes cuenta?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Open Sans'),
                ),
                GestureDetector(
                  child: Text(
                    ' Consigue una aquí',
                    style: TextStyle(
                        color: Color.fromRGBO(231, 74, 47, 1),
                        fontSize: 14,
                        fontFamily: 'Open Sans'),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => SignUp()));
                  },
                ),
              ],
            ),

            //EdgeInsets.symmetric(horizontal: 110, vertical: 20),
            //child: highlightColor Color.fromRGBO(255, 106, 81, 1),
            //shape: StadiumBorder(),
            // shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(15.0)),
          ],
        ),
      ),
    );
  }
}
