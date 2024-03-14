import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectapp/widget/login/login_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // Map<String, dynamic> login(String email, String password) async {
  //   FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  //   final response = await http.post('http://api.com/user', body: {
  //     'email': email,
  //     'password': password,
  //   });
  //   final decoded = jsonDecode(response.body) as Map<String, dynamic>;
  //   return decoded;
  // }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        child: Column(children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image.asset("assets/images/logo_text_small.png"),
                 SizedBox(height: 30),
                 Padding(
                   padding: const EdgeInsets.only(bottom: 0),
                   child: Image.asset("assets/images/login_images.png"),
                 ),
              ],
            ),
          ),
          Expanded(child: 
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: LoginWidget(email: '', password: '',),
              ),
            )
          ),
        ],),
      ),
    );
  }
}
