import 'package:ejercicio0/providers/userPrv.dart';
import 'package:ejercicio0/utils/string_adm.dart';
import 'package:ejercicio0/utils/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  User user = User();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserPrv userProvider = Provider.of<UserPrv>(context);
    //final VariablesPrv varProv = Provider.of<VariablesPrv>(context);
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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 30),
                child: SvgPicture.asset(
                  'assets/images/signUp.svg',
                  height: size.height * 0.18,
                ),
              ),
            ),
            Container(
                child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 40,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          (RegExp(r'[a-zA-Z\W0-9]+|\s'))),
                    ],
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Ingresa tu Nombre";
                      }
                      if (value.length < 4) {
                        return 'Nombre demasiado corto';
                      }
                      if (value.contains(new RegExp(r'[0-9]'))) {
                        return 'No puede ingresar numeros';
                      }
                      user.name = value;
                      return null;
                    },
                    style: TextStyle(fontSize: 14.0, fontFamily: 'Ubuntu'),
                    //controller: Controller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Name',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  TextFormField(
                    maxLength: 40,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Ingrese un email valido";
                      }
                      if (!StringAdm.validateEmail(value)) {
                        return 'Ingresa un email valido';
                      }
                      user.email = value;
                      return null;
                    },
                    style: TextStyle(fontSize: 14.0, fontFamily: 'Ubuntu'),
                    //controller: Controller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  TextFormField(
                    maxLength: 40,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Ingrese su numero de telefono";
                      }
                      if (value.length != 10) {
                        return 'Su numero debe tener 10 digitos';
                      }
                      user.phone = value;
                      return null;
                    },
                    style: TextStyle(fontSize: 14.0, fontFamily: 'Ubuntu'),
                    //controller: Controller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Telephone number',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  TextFormField(
                    maxLength: 40,

                    validator: (value) {
                      if (value.length < 4) {
                        return 'Contraseña demasiado corta';
                      }
                      user.password = value;
                      return null;
                    },
                    style: TextStyle(fontSize: 14.0, fontFamily: 'Ubuntu'),
                    //controller: Controller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  TextFormField(
                    maxLength: 40,
                    validator: (value) {
                      if (!StringAdm.validatePasswords(value, user.password)) {
                        return "Las contraseñas no coinciden";
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: 14.0, fontFamily: 'Ubuntu'),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Confirm Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextButton(
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        userProvider.user = user; // set user
                        userProvider.users = user; // add user to a List<user>
                        final savedDataMessage = SnackBar(
                          content: Text('¡Los datos se han guardado!'),
                        );
                        // Scaffold.of(context).showSnackBar(savedDataMessage);
                        _formKey.currentState.save();
                        print('aqui va');
                        //await Future.delayed(Duration(seconds: 3));
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        backgroundColor: Color.fromRGBO(231, 74, 47, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 110, vertical: 20),
                      ),
                      child: Text(
                        'REGISTRARSE',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Open Sans',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
