import 'package:advance_basics/data/questions.dart';
import 'package:advance_basics/questions_screen.dart';
import 'package:advance_basics/results_screen.dart';
import 'package:advance_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {

  const Quiz({super.key});

  @override
  State<Quiz> createState() {
      return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

 // Approach to switch screens
  // Widget? activeScreen;
  //
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions_screen';
    });
  }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'questions_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
        setState(() {
          activeScreen = 'result_screen';
        });
    }
  }

  @override
  Widget build(context) {
    // TODO: implement build

    // Alternate approach to switch screens
    // final screenWidget = activeScreen == 'start-screen'
    // ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions_screen') {
        screenWidget =  QuestionsScreen(
            onSelectAnswer: chooseAnswer
        );
    }

    if (activeScreen == 'result_screen') {
      screenWidget =  ResultsScreen(
          chosenAnswers: selectedAnswers,
          onRestart: restartQuiz
      );
    }

    return MaterialApp(
      home: Scaffold(
        body:
        //GradientContainer.purple(),
        Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
        colors: [
        Colors.purple,
          Colors.deepPurple,
        ],
        begin: startAlignment,
        end: endAlignment,
    ),
    ),
          child: screenWidget,
        ),
      ),
    );
  }

}