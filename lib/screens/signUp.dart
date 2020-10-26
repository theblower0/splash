import 'package:ejercicio0/components/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 249, 239, 1),
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Color.fromRGBO(231, 74, 47, 1),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 35, bottom: 30),
            child: SvgPicture.asset(
              'assets/images/signUp.svg',
              height: size.height * 0.18,
            ),
          ),
          TextFields(hintText: 'Name'),
          TextFields(hintText: 'Email'),
          TextFields(hintText: 'Teléfono'),
          TextFields(hintText: 'Contraseña'),
          TextFields(hintText: 'Confirmar contraseña'),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: TextButton(
              onPressed: () {
                /* nombre = nombreController.text;
                  print("El nombre que escribiste es: $nombre");*/
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                backgroundColor: Color.fromRGBO(231, 74, 47, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 110, vertical: 20),
              ),
              child: Text(
                'REGISTRARSE',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22, fontFamily: 'Open Sans', color: Colors.white),
              ),
            ),
          )
        ],
      )),
    );
  }
}
