import 'package:flutter/material.dart';
import 'package:projectapp/pages/statistic.dart';
import 'package:projectapp/pages/home.dart';
import 'package:projectapp/pages/statistic.dart';
import 'package:projectapp/widget/app_bottom_navigation_bar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index){
      case 0:
        Navigator.pushReplacement(
          context, MaterialPageRoute
          (builder: (context) => Profile()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context, MaterialPageRoute
          (builder: (context) => Home()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context, MaterialPageRoute
          (builder: (context) => Statistic()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil"
        ),
      ),
      body: SingleChildScrollView(
        // isi halaman profil di sini
      ),
    );
  }
  Widget buildAppBar(){
    final theme = Theme.of(context);
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text(
              'Profil',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ]
      ),
    );
  }
}
