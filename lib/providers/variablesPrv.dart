import 'package:flutter/cupertino.dart';

class VariablesPrv with ChangeNotifier {
  int _edad = 18;

  get edad {
    return _edad;
  }

  set edad(int edad) {
    _edad = edad;
    notifyListeners();
  }
}
