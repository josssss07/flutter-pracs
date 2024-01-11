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
        title: const Text('Stuff Calcuator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RectanglePage()),
                  );
                },
                child: const Text("area of Rectangle")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EMIPage()),
                  );
                },
                child: const Text("calculate EMI")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BMIPage()),
                  );
                },
                child: const Text("calculate BMI")),
          ],
        ),
      ),
    );
  }
}
