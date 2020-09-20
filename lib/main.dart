import 'package:firebase/homePage.dart';
import 'package:firebase/loginpage.dart';
import 'package:firebase/signuppage.dart';
import 'package:flutter/material.dart';


void main () => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new LoginPage(),
      routes: <String, WidgetBuilder>{
        '/landingPage': (BuildContext context) => new MyApp(),
        '/signup': (BuildContext context) => new SignUpPage(),
        'home': (BuildContext context) => new HomePage()
      },
    );
  }
}