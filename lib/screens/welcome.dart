import 'package:ejercicio0/screens/login.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 249, 239, 1),
      child: Column(
        mainAxisSize: MainAxisSize.max, //lena todo el espacio vertical
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage('assets/images/balloon-shape.png'),
          ),
          Center(
            child: Padding(
              //formas de hacer padding
              padding: const EdgeInsets.only(top: 30),
              //padding: const EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
              //padding: const EdgeInsets.symmetric(vertical: 100),
              child: Image(
                image: AssetImage('assets/images/FastFood-Logo.png'),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image(
                image: AssetImage('assets/images/online_groceries.png'),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'El directorio de comida',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(71, 34, 18, 1),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 70),
              child: Text(
                'Busca. Encuentra. Pide. \n'
                'Recibe. Disfruta.',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(71, 34, 18, 1),
                ),
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Login()));
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                backgroundColor: Color.fromRGBO(231, 74, 47, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
              ),
              child: Text(
                'INICIA AHORA',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22, fontFamily: 'Open Sans', color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
