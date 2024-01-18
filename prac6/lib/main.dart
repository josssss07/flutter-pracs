// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double pi = 3.14159;
  double degree = 0;
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: visible,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(pi * degree / 180),
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/donut.png'),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                    degree += 30;
                  });
                },
                child: Text("Do things"),
              )
            ],
          ),
        ],
      )),
    );
  }
}
