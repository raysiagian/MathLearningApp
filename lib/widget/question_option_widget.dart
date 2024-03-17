import 'package:flutter/material.dart';
import 'package:projectapp/models/level.dart';
import 'package:projectapp/models/option.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuestionOptionWidget extends StatelessWidget {
  const QuestionOptionWidget({
    Key? key,
    required this.options, required bool isSelected, required Null Function() onOptionSelected,
  }) : super(key: key);

  final String options;

    Future<List<Option>> fetchUnit() async {
    try {
      final response =
          await http.get(Uri.parse('http://10.0.2.2:8000/api/getOption'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)['data'] as List<dynamic>;
        return jsonData.map((e) => Option.fromJson(e)).toList();
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
    return InkWell(
      onTap: () {
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$options',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
