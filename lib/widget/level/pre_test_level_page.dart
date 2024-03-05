import 'package:flutter/material.dart';
import 'package:projectapp/models/level.dart';
import 'package:projectapp/models/materi.dart';
import 'package:projectapp/widget/dialog_question_on_close.dart';
import 'package:projectapp/widget/question_option_widget.dart';
import 'package:projectapp/widget/question_widget.dart';
import 'package:projectapp/widget/selanjutnya_button.dart';

class PreTestLevelPage extends StatefulWidget {
  const PreTestLevelPage({
    Key? key,
    required this.level,
    required this.materi,
  }) : super(key: key);

  final Level level;
  final Materi materi;

  @override
  State<PreTestLevelPage> createState() => _PreTestLevelPageState();
}

class _PreTestLevelPageState extends State<PreTestLevelPage> {
  int index = 0;

  void pertanyaanSelanjutnya() {
    if (index == widget.level.questions.length - 1) {
      return;
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.level.questions[index];
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
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return DialogQuestionOnClose(materi: widget.materi);
              });
          },
        ),
        title: Text('Level ${widget.level.number}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  QuestionWidget(
                    question: question.title,
                    indexAction: index,
                    totalQuestion: widget.level.questions.length,
                  ),
                ],
              ),
            ),
            SizedBox(height: 100), // Add spacing between QuestionWidget and QuestionOptionWidget
            Row(
              children: question.options.keys.map((option) {
                return Expanded(
                  child: QuestionOptionWidget(options: option),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SelanjutnyaButton(
          pertanyaanSelanjutnya: pertanyaanSelanjutnya,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
