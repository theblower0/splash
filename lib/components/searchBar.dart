import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Buscar platillos o restaurantes',
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.white30,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          )),
    );
  }
}
