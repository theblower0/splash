import 'package:ejercicio0/providers/userPrv.dart';
import 'package:ejercicio0/providers/variablesPrv.dart';
import 'package:ejercicio0/screens/dashboard.dart';
//import 'package:ejercicio0/screens/login.dart';
import 'package:ejercicio0/screens/start.dart';
import 'package:ejercicio0/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserPrv()),
        ChangeNotifierProvider(create: (_) => VariablesPrv()),
      ],
      child: App(),
    ),
  );
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
        // Dashboard(),
      ])),
    );
  }
}
