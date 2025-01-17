import 'package:flutter/material.dart';
import'package:flutter_bloodia/component/rounded_button.dart';
import 'package:flutter_bloodia/screens/chat_screen.dart';
import 'package:flutter_bloodia/screens/login_screen.dart';
import 'package:flutter_bloodia/constants.dart';
import 'package:flutter_bloodia/component/rounded_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}
  class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email ;
  String password;
  String bloodType;
  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
            height: 8.0,
            ),
            TextField(
                keyboardType:TextInputType.emailAddress ,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email=value ;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter You Email")
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password=value ;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: "Enter You PAssword")
            ),
            SizedBox(
              height: 8.0,
            ),

            RoundedButton(title:'Sign Up' , color:Colors.blueAccent , onPressed: () async{
              try{
                final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                if(newUser != null)
                  {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
              }
              catch(e){
                print(e);
              }

            },),
          ],
        ),
      ),
    );
  }
}
