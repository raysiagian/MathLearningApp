import 'package:flutter/material.dart';
import 'package:projectapp/models/materi.dart';
import 'package:projectapp/widget/home_materi_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final listMateri = Materi.listMateri;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Ray Siagian"),
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: 
        Container(
          margin: EdgeInsets.all(10),
          child: Image.asset(
            "assets/images/icon_profile man.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
      backgroundColor: theme.colorScheme.secondary,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background_screen.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          ListView(
            children: [
              // buildAppBar(),
              ...listMateri.map((materi) {
                return HomeMateriCard(materi: materi);
              })
            ]
          )
        ],
      ),
    );
  }

  Widget buildAppBar() {
    final theme = Theme.of(context);
    return Container(
      height: 90,
      padding: EdgeInsets.only(left: 20.0, top: 50.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                "assets/images/icon_profile man.png",
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 7.0),
                child: Text(
                  "Ray Siagian",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
