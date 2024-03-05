import 'package:flutter/material.dart';
import 'package:projectapp/models/level.dart';
import 'package:projectapp/models/materi.dart';
import 'package:projectapp/widget/dialog_question_on_close.dart';

class MateriLevelPage extends StatefulWidget {
  const MateriLevelPage({super.key, required this.materi, required this.level});

  final Materi materi;
  final Level level;

  @override
  State<MateriLevelPage> createState() => _MateriLevelPageState();
}

class _MateriLevelPageState extends State<MateriLevelPage> {
  // id rules
  // angka pertama menunjukkan materi
  // angka kedua menunjukkan urutan level
  // angka ketiga menujukkan urutan pertanyaan

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.colorScheme.primary,
          ),
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return DialogQuestionOnClose(
                  materi: widget.materi,
                );
            });
          },
        ),
        title: Text('Level ${widget.level.number}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            // video
            // description
          ],
        ),
      ),
    );
  }
}
