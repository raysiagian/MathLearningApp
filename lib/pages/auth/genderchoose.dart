import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/models/gender.dart';
import 'package:projectapp/models/usermodel.dart';
import 'package:projectapp/pages/home.dart';
import 'package:projectapp/widget/register/gender_widget.dart';


class GenderChoose extends StatefulWidget {
  const GenderChoose({super.key,
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  State<GenderChoose> createState() => _GenderChooseState();
}

class _GenderChooseState extends State<GenderChoose> {
  final List<Gender> listGender = Gender.listGender;
  String selectedGender = 'P';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              "Pilih Jenis Kelamin",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: List.generate(listGender.length, (index) {
                  final gender = listGender[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = gender.code;
                      });
                    },
                    child: GenderWidget(
                      gender: gender,
                      selectedGender: selectedGender,
                    )
                  );
                }
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                try{
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: widget.email, 
                    password: widget.password
                  );
                  User? user = userCredential.user;
                  await user!.updateProfile(
                    displayName: widget.name,
                  );
                  await user.reload();
                  user = FirebaseAuth.instance.currentUser;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Home();
                      }
                    )
                  );
                } on FirebaseAuthException catch (e){
                  Navigator.pop(context, widget.name);
                  
                  SnackBar(
                    content: Text('Akun sudah digunakan, gunakan akun lainnya'),
                    duration: Duration(seconds: 5),
                  );
                }
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
                  'Daftar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
