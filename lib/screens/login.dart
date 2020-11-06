import 'package:ejercicio0/providers/userPrv.dart';
import 'package:ejercicio0/screens/dashboard.dart';
import 'package:ejercicio0/screens/signUp.dart';
import 'package:ejercicio0/utils/string_adm.dart';
import 'package:ejercicio0/utils/user.dart';
//import 'package:ejercicio0/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  User user = User();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
  }

  final sb = SnackBar(
    content: Text('¡Usuario o contraseña incorrectos!'),
  );

  final snackBartoDashBorad = SnackBar(
    content: Row(
      children: [
        CircularProgressIndicator(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text('Ingresando a tu DashBoard'),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final UserPrv userProvider = Provider.of<UserPrv>(context);
    return Scaffold(
      key: _formKey,
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      maxLength: 40,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s'))
                      ],
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Ingresa tu email";
                        }
                        user.email = value;
                        return null;
                      },
                      //controller: Controller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.black,
                        ),
                        hintText: 'Email user',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),

                    TextFormField(
                      maxLength: 40,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Ingresa tu contraseña";
                        }
                        if (value.contains(new RegExp(r'[0-9]'))) {
                          return 'No puede ingresar numeros';
                        }
                        if (value.length < 4) {
                          return 'Nombre demasiado corto';
                        }
                        user.password = value;
                        return null;
                      },
                      //controller: Controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        var retUser = userProvider.getUser(user.email);
                        retUser == null
                            ? print('no salio prro')
                            : validatePassword(context, retUser, user);
                        _formKey.currentState.save();
                        /*  if (retUser != null) {
                    if (!StringAdm.validatePasswords(
                        retUser.password, user.password)) {
                      Scaffold.of(context).showSnackBar(sb);
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    }
                  }*/
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        backgroundColor: Color.fromRGBO(231, 74, 47, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 110, vertical: 20),
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
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => SignUp()));
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
            ),
          ],
        ),
      ),
    );
  }

  validatePassword(context, User retUser, User user) async {
    if (!StringAdm.validatePasswords(retUser.password, user.password)) {
      //Scaffold.of(context).showSnackBar(sb);
      print('si se pudo prro');
    } else {
      //Scaffold.of(context).showSnackBar(snackBartoDashBorad);
      await Future.delayed(Duration(seconds: 4));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }
}
