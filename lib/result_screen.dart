import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzapp/data/collection.dart';
import 'package:quizzapp/model/question_summary.dart';

class Resultscreen extends StatelessWidget {
  const Resultscreen(this.choosenAnswer, this.restartQuiz, {super.key});
  final void Function() restartQuiz;
  final List<String> choosenAnswer;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summery = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summery.add({
        'question-index': i + 1,
        'question': questions[i].questionText,
        'correct-answer': questions[i].answerText[0],
        'user-answer': choosenAnswer[i],
      });
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final summatyData = getSummaryData();
    final numberOfQuestion = questions.length;
    final numberOfCorrectAnsweredQuestion =
        summatyData.where((data) {
          return data['user-answer'] == data['correct-answer'];
        }).length;

    return Container(
      margin: EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numberOfCorrectAnsweredQuestion out of $numberOfQuestion correctly!',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: QuestionSummary(getSummaryData()),
              ),
            ),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 4, 2, 72),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              label: Text(
                'Restart quiz',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(),
              ),
              icon: Icon(Icons.restart_alt),
            ),
          ],
        ),
      ),
    );
  }
}
