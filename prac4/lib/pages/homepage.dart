// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  void launchBrowser() async {
    const url = 'https://xaviers.ac/';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      print('Kill yourself UwU');
    }
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Pressed $text')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Button but BIGGER'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                showSnackBar(context, "Text Button");
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.disabled_by_default),
                  Text('Disabled')
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  launchBrowser();
                },
                child: Text("open xaviers site"))
          ],
        ),
      ),
    );
  }
}
