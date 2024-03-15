import 'package:flutter/material.dart';
import 'package:projectapp/models/materi.dart';
import 'package:projectapp/pages/home_wrapper/home_wrapper.dart';
import 'package:projectapp/widget/unit/unit_widget.dart';

class MapMateri extends StatelessWidget {
  const MapMateri({super.key, required this.materi});

  final Materi materi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(materi.title),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context) => HomeWrapper()), 
              (route) => false,
            );
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            r'http://10.0.2.2:8000/storage/' + materi.imageBackground.replaceFirst('public/', ''),
            height: 150,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          // Image.asset(
          //   materi.imageBackground,
          //   fit: BoxFit.cover,
          // ),
          ListView.builder(
            itemCount: materi.units.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final unit = materi.units[index];
              return UnitWidget(unit: unit, materi: materi);
            },
          ),
        ],
      ),
    );
  }
}
