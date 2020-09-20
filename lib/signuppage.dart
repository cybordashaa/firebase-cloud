import 'package:firebase/services/user.management.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget{
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
                controller: emailController,
                // onChanged: (value){
                //   setState(() {
                //     _email = value;
                //     print(_email);
                //   });
                // },
              ),
              SizedBox(height: 15.0,),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Password'),
                // onChanged: (value){
                //   setState(() {
                //     _password = value;
                //   });
                // },
                obscureText: true,
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text('Sign Up'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((signedInUser){
                    UserManagement().storeNewUser(signedInUser, context);
                  }).catchError((e){
                    print(e);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}