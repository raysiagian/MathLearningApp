import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/pages/auth/register.dart';
import 'package:projectapp/pages/home.dart';
import 'package:projectapp/widget/login/textfield_widget.dart';
import 'package:projectapp/models/user.dart' as u;

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  final String email;
  final String password;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 50),
              TextFieldWidget(controller: _emailController, label: 'Email', validator: (value) {
                if(!value!.contains('@')){
                  return 'Email tidak valid';
                }
                return null;
              },),
              SizedBox(height: 20),
              TextFieldWidget(controller: _passwordController, label: 'Password', isPassword: true,),
              SizedBox(height: 100),
              GestureDetector(
                onTap: () async{
                  if(_formKey.currentState!.validate()){
                    try{
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailController.text, 
                        password: _passwordController.text
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                    );
                    }catch(e){
                      print('Email atau Password salah');
                    }
                  }
                  // FirebaseAuth.instance.createUserWithEmailAndPassword(
                  //   email:_emailController.text, 
                  //   password: _passwordController.text
                  // );
                  // String email = _emailController.text;
                  // String password = _passwordController.text;
                  // _formKey.currentState!.validate();
                },
                child: Container(
                  height: 44,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                 Navigator.push(
                   context,
                  MaterialPageRoute(builder: (context) => Register()),
                 );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Theme.of(context).colorScheme.secondary), // Warna garis sesuai dengan warna sekunder dari tema
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: SizedBox(
                  height: 44,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Daftar',
                       textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary, // Warna teks sesuai dengan warna sekunder dari tema
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
