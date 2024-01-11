import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: weight,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.monitor_weight_outlined),
                    labelText: 'weight',
                    hintText: 'in kg',
                  ),
                ),
                TextField(
                  controller: height,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.height),
                    labelText: 'height ',
                    hintText: 'in meters',
                  ),
                )
              ],
            )));
  }
}
