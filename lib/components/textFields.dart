import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final String hintText;
  const TextFields({
    Key key,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
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
          /*prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),*/

          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
