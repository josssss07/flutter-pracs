// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RectanglePage extends StatefulWidget {
  const RectanglePage({super.key});

  @override
  State<RectanglePage> createState() => _RectanglePageState();
}

class _RectanglePageState extends State<RectanglePage> {
  TextEditingController lenght = TextEditingController();
  TextEditingController breadth = TextEditingController();
  late int area;
  late int lengthInt;
  late int breadthInt;

  void calculate(int lenghth, int breadth) {
    area = lenghth * breadth;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rect Area Calc'),
      ),
      body: Padding(
        padding: EdgeInsets.all(9),
        child: Column(
          children: <Widget>[
            Text("enter length : "),
            SizedBox(height: 2),
            TextField(
              controller: lenght,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'length',
              ),
            ),
            SizedBox(height: 2),
            Text("Breadth"),
            SizedBox(height: 2),
            TextField(
              controller: breadth,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'length',
              ),
            ),
            SizedBox(height: 2),
            ElevatedButton(
                onPressed: () {
                  lengthInt = int.parse(lenght.text);
                  breadthInt = int.parse(breadth.text);
                  calculate(lengthInt, breadthInt);
                },
                child: Text("calculate area"))
          ],
        ),
      ),
    );
  }
}
