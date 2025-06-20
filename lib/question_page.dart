import 'package:flutter/material.dart';
import 'package:quizzapp/answer_button.dart';
import 'package:quizzapp/data/collection.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.onSelectedAnswer});
  final void Function(String selectedAnswer) onSelectedAnswer;
  @override
  State<QuizPage> createState() {
    return _QuizPageStates();
  }
}

class _QuizPageStates extends State<QuizPage> {
  var currentquestionindex = 0;

  void answerquestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentquestionindex++;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[currentquestionindex];

    return Container(
      margin: EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.questionText,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 141, 96, 240),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentquestion.getsuffledlist().map((item) {
              return AnswerButton(
                onTap: () {
                  answerquestion(item);
                },
                answerText: item,
              );
            }),
          ],
        ),
      ),
    );
  }
}
