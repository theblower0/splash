import 'package:ejercicio0/components/horizontalItems.dart';
import 'package:ejercicio0/components/horizontalRecomended.dart';
import 'package:ejercicio0/components/horizontalSections.dart';
import 'package:ejercicio0/components/searchBar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

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
      body: Container(
        //height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            //scrollDirection: Axis.vertical,
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 550, //MediaQuery.of(context).size.height,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(231, 74, 47, 1),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    height: 170.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Hola Adrian',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: 'Open Sans',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              '¿Que quieres comer hoy?',
                              style: TextStyle(
                                //fontWeight: FontWeight,
                                fontFamily: 'Open Sans',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: SearchBar(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                    child: Text(
                      'Populares cerca de tí',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: HorizontalItems(),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                    child: Text(
                      'Explorar categorías',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  HorizontalSections(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                    child: Text(
                      'Recomendados',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  HorizontalRecomended(),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
