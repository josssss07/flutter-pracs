// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {

   void showStuff(){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text('tapped list button :'),
          actions: <Widget>[
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text('Close'))
          ],
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic List'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Photos'),
            onTap: showStuff,
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
            onTap: showStuff
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
            onTap: showStuff
          ),
        ],
      ),
    );
  }
}