import 'package:ejercicio0/screens/start.dart';
import 'package:ejercicio0/screens/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fast food App",
      //home: Welcome(),
      home: Scaffold(
          body: PageView(physics: BouncingScrollPhysics(), children: <Widget>[
        Start(),
        Welcome(),
      ])),
    );
  }
}
