import 'package:firebase/loginpage.dart';
import 'package:flutter/material.dart';


void main () => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new LoginPage(),
      routes: <String, WidgetBuilder>{
        '/landingPage': (BuildContext context) => new MyApp()
      },
    );
  }
}