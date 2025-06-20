import 'package:flutter/material.dart';
import 'package:quizzapp/data/collection.dart';
import 'package:quizzapp/question_page.dart';
import 'package:quizzapp/result_screen.dart';
import 'package:quizzapp/start_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizStates();
  }
}

class _QuizStates extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'quiz-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget widgetScreen = StartPage(switchScreen);
    if (activeScreen == 'quiz-screen') {
      widgetScreen = QuizPage(onSelectedAnswer: chooseAnswer);
    }
    if (activeScreen == 'result-screen') {
      widgetScreen = Resultscreen(selectedAnswers, restartQuiz);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 20, 1, 96),
                Color.fromARGB(255, 28, 1, 138),
                Color.fromARGB(255, 45, 2, 219),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: widgetScreen,
        ),
      ),
    );
  }
}
