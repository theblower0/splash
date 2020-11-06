import 'package:ejercicio0/components/searchBar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 249, 239, 1),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(231, 74, 47, 1),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            height: 200.0,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hola Adrian',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '¿Que quieres comer hoy?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: SearchBar(),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
