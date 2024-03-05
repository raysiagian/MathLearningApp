import 'package:flutter/material.dart';
import 'package:projectapp/core/theme/theme.dart';
import 'package:projectapp/widget/app_bottom_navigation_bar.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistik"),
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
      ),
      backgroundColor: Colors.transparent, // Atur latar belakang scaffold menjadi transparan
      body: Stack(
        children: [
          Container(
            // Gunakan container sebagai background dengan gambar
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_screen.png"), // Tambahkan path gambar latar belakang
                fit: BoxFit.cover, // Atur agar gambar meliputi seluruh background
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * .6,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 2,
                      children: [
                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/penjumlahan_statistic_backrgound.png"),
                            ),
                          ),
                        ),
                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/pengurangan_statistic_backrgound.png"),
                            ),
                          ),
                        ),
                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/perkalian_statistic_backrgound.png"),
                            ),
                          ),
                        ),
                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/pembagian_statistic_backrgound.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
