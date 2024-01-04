import 'package:flutter/material.dart';
import 'package:prac3/pages/homepage.dart';


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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Username'),
            SizedBox(height: 10,),
            Container(
              width: 300,
              child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter username',
              ),
              controller: usernameController,
            )

            ),
            SizedBox(height: 10,),
            Container(
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
            ElevatedButton(onPressed: (){
              username = usernameController.text;
              password = passwordController.text;
              if(username.isNotEmpty && password.isNotEmpty){
                Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> Homepage()));
    });
              }
            }, child: Column(children: <Widget>[
              SizedBox(height: 20,),
              Text('Login(no validation)')
            ],))
          ],
        
        ),
      ),
    );
  }
}


//ignore
//ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';

// class LogInPage extends StatefulWidget {
//   const LogInPage({super.key});

//   @override
//   State<LogInPage> createState() => _LogInPageState();
// }

// class _LogInPageState extends State<LogInPage> {
//   final userNameController = TextEditingController();
//   final passWordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Log in'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(children: <Widget>[
//           Text('Username: '),
//           SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             controller: userNameController,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'enter your UserName'
//             ),
//           ),
//           SizedBox(height: 10,),
//           Text('Username: '),
//           SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             controller: passWordController,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'password'
//             ),
//           ),
//         ]),
//       ),
//     );  
//   }
// }