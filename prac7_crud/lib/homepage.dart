// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController gpa = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController cc = TextEditingController();

  void create(String studentId, studentName, studentCC, studentGPA) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("students");

    Map<String, dynamic> studentData = {
      "StudentId": studentId,
      "StudentName": studentName,
      "cc": studentCC,
      "gpa": studentGPA
    };

    reference
        .add(studentData)
        .then((value) => print("added"))
        .catchError((error) => print("failed....... :< $error"));
  }

  void read() {}
  void update() {}
  void delete() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("airbase inc."),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: name,
                decoration: const InputDecoration(
                    labelText: "Student Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: id,
                decoration: const InputDecoration(
                    labelText: "Student ID",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: cc,
                decoration: const InputDecoration(
                    labelText: "Course code",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: gpa,
                decoration: const InputDecoration(
                    labelText: "Student GPA",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () =>
                      create(id.text, name.text, cc.text, gpa.text),
                  child: Text('Create'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Read'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Update'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Delete'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
