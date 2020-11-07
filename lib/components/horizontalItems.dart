import 'package:ejercicio0/utils/SetData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalItems extends StatelessWidget {
  final List<SetData> dataList = [
    SetData("Mc Burger", "Hamburguesas Alitas Nachos", "4.7", "20 min", "300 m",
        "burger.jpg"),
    SetData("Chicken Tacos", "Tacos al de pollo", "4.0", "25 min", "200 m",
        "tacos.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: dataList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) =>
                itemCard(context, index),
          ))
        ],
      ),
    );
  }

  Widget itemCard(BuildContext context, int index) {
    final data = dataList[index];
    return Container(
      //padding: EdgeInsets.all(5),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              //Container de card
              margin: EdgeInsets.only(top: 10, left: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(90), blurRadius: 10.0),
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/${data.image}',
                        height: 150.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  /* child: Image.asset(
                      "assets/images/${data.image}",
                      height: 150,
                    ),*/

                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      data.name,
                      //textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      data.data,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(data.rate,
                                  style: TextStyle(
                                      color: Colors.red[800], fontSize: 15)),
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 240, 211, 1),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          color: Colors.black),
                                      Text(
                                        data.distance,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 240, 211, 1),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.black),
                              Text(
                                data.time,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
