import 'package:flutter/material.dart';
import 'package:projectapp/models/level.dart';
import 'package:projectapp/models/materi.dart';
import 'package:projectapp/widget/level/materi_level_page.dart';
import 'package:projectapp/widget/level/post_test_level_page.dart';
import 'package:projectapp/widget/level/pre_test_level_page.dart';

class LevelButtonWidget extends StatelessWidget {
  const LevelButtonWidget({
    super.key,
    required this.level,
    required this.materi,
  });

  final Level level;
  final Materi materi;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              switch (level.type) {
                case LevelType.pretest:
                  return PreTestLevelPage(
                    level: level,
                    materi: materi,
                  );
                case LevelType.materi:
                  return MateriLevelPage(
                    level: level,
                    materi: materi,
                  );
                case LevelType.postTest:
                  return PostTestLevelPage(
                    level: level,
                  );
              }
            },
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0), // Margin 20 px ke atas dan ke bawah
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              level.number,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
