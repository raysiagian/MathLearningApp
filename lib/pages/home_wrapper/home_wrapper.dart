import 'package:flutter/material.dart';
import 'package:projectapp/pages/home.dart';
import 'package:projectapp/pages/profile.dart';
import 'package:projectapp/pages/statistic.dart';
import 'package:projectapp/widget/app_bottom_navigation_bar.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int selectedIndex = 0;
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: [
          Home(),
          Statistic(),
          Profile(),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          setState(() {
            selectedIndex = index;
            pageViewController.animateTo(
              MediaQuery.of(context).size.width * index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
    );
  }
}
