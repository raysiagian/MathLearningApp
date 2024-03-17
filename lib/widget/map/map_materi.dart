import 'package:flutter/material.dart';
import 'package:projectapp/models/materi.dart';
import 'package:projectapp/models/unit.dart';
import 'package:projectapp/pages/home_wrapper/home_wrapper.dart';
import 'package:projectapp/widget/unit/unit_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MapMateri extends StatelessWidget {
  const MapMateri({super.key, required this.materi});

  final Materi materi;

  Future<List<Unit>> fetchUnit() async {
    try {
      final response =
          await http.get(Uri.parse('http://10.0.2.2:8000/api/getUnit'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)['data'] as List<dynamic>;
        return jsonData.map((e) => Unit.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FutureBuilder(
      future: fetchUnit(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(), // or any loading indicator
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.data == null) {
          // Handle case where data is null
          return Center(
            child: Text('No data available'),
          );
        } else {
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
                  r'http://10.0.2.2:8000/storage/' +
                      materi.imageBackground.replaceFirst('public/', ''),
                  height: 150,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                // Image.asset(
                //   materi.imageBackground,
                //   fit: BoxFit.cover,
                // ),
                // ListView.builder(
                //   itemCount: materi.units.length,
                //   shrinkWrap: true,
                //   itemBuilder: (context, index) {
                //     final unit = materi.units[index];
                //     return UnitWidget(unit: unit, materi: materi);
                //   },
                // ),
                ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final unit = snapshot.data![index];
                    return UnitWidget(unit: unit, materi: materi);
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
