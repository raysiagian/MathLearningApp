import 'package:flutter/material.dart';
import 'package:projectapp/models/level.dart';
import 'package:projectapp/models/materi.dart';
import 'package:projectapp/models/timer_model.dart';
import 'package:projectapp/widget/dialog_question_on_close.dart';
import 'package:projectapp/widget/question_option_widget.dart';
import 'package:projectapp/widget/question_widget.dart';
import 'package:projectapp/widget/timer_widget.dart';
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
  int totalScore = 0;
  late TimerModel timerModel;
  String? selectedOption;

  @override
  void initState(){
    super.initState();
    timerModel = TimerModel(
      durationInSeconds: 10, 
      onTimerUpdate: updateTimerUI, 
      onTimerFinish: timerFinishAction,
    );
    timerModel.startTimer();
  }

  void updateTimerUI(int remainingTime){
    setState(() {});
  }

  void timerFinishAction() async{
    timerModel.dispose();

    await Future.delayed(Duration(seconds: 1));

    int currentScore = calculateScore();

    if (index < widget.level.questions.length - 1){
      setState(() {
        index ++;
        totalScore += currentScore;
        selectedOption = null;

        timerModel = TimerModel(
          durationInSeconds: 10, 
          onTimerUpdate: updateTimerUI, 
          onTimerFinish: timerFinishAction,
        );
        timerModel.startTimer();
      });
    }else{
      print("All question answered");
      print("Total Score: $totalScore");
    }
  }

  int calculateScore(){
    int currentScore = 0;
    final currentQuestion = widget.level.questions[index];

    currentQuestion.options.forEach((key, value) {
      if(value){
        if(selectedOption == key){
          currentScore += 10;
        }
      }
    });
    return currentScore;
  }

  void pertanyaanSelanjutnya() {
    if (index < widget.level.questions.length -1 ){
      setState(() {
        index++;
        selectedOption = null;

        timerModel.dispose();
        timerModel = TimerModel(
          durationInSeconds: 10, 
          onTimerUpdate: updateTimerUI, 
          onTimerFinish: timerFinishAction,
        );
        timerModel.startTimer();
      });
    }
    @override
    void dispose() {
      timerModel.dispose();
      super.dispose();
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
                  TimerWidget(timerModel: timerModel),
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
                  child: QuestionOptionWidget(
                    options: option,
                    onOptionSelected:(){
                      setState(() {
                        selectedOption = option;
                      });
                    },
                    isSelected: option == selectedOption,
                  ),
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
