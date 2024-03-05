import 'package:flutter/material.dart';
import 'package:projectapp/models/level.dart';

class QuestionOptionWidget extends StatelessWidget {
  const QuestionOptionWidget({
    Key? key,
    required this.options,
  }) : super(key: key);

  final String options;

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
