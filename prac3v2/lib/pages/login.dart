import 'package:flutter/material.dart';
import 'package:prac3v2/pages/homepage.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var username = '';
  var password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Username'),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter username',
                  ),
                  controller: usernameController,
                )),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password',
                ),
                obscureText: true,
                obscuringCharacter: '*',
                controller: passwordController,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  username = usernameController.text;
                  password = passwordController.text;
                  if (username.isNotEmpty &&
                      password.isNotEmpty &&
                      username == password) {
                    Future.delayed(Duration(seconds: 3), () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => HomePage()));
                    });
                  }
                },
                child: Text('Enter'))
          ],
        ),
      ),
      */
      body: Center(child: LoginForm()),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginformKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var username = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginformKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your username',
                  labelText: 'Username',
                ),
                controller: usernameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              )),
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                hintText: 'Enter your password',
                labelText: 'Password',
              ),
              obscureText: true,
              obscuringCharacter: '*',
              controller: passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (_loginformKey.currentState!.validate()) {
                      username = usernameController.text;
                      password = passwordController.text;
                      if (username == password) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => HomePage()));
                      }
                    }
                  },
                  child: Text('Enter'))),
        ],
      ),
    );
  }
}

//ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers
