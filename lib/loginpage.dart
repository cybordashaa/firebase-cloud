import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;
    final emailController = new TextEditingController();
    final password = new TextEditingController();
    // TODO: implement build
    return new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(height: 15.0,),
              TextField(
                controller: password,
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text('Login'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: password.text).then((AuthResult auth) { 
                    Navigator.of(context).pushReplacementNamed('/home');
                    }).catchError((e){print(e);});
                },
              ),
              SizedBox(height: 15.0,),
              Text('Don\'t have been account?'),
              SizedBox(height: 10.0,),
              RaisedButton(
                child: Text('Sign Up'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                  Navigator.of(context).pushNamed('/signup');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}