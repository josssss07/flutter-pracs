import 'package:flutter/material.dart';
import 'package:prac5/pages/bmipage.dart';
import 'package:prac5/pages/emipage.dart';
import 'package:prac5/pages/rectangle.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stuff Calcuator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RectanglePage()),
                );
              }, child: Text("area of Rectangle")),
              ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EMIPage()),
                );
              }, child: Text("area of Rectangle")),
              ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BMIPage()),
                );
              }, child: Text("area of Rectangle")),
          ],
        ),
      ),
    );
  }
}