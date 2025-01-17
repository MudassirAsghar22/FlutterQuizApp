
import 'package:advance_basics/data/questions.dart';
import 'package:advance_basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;


  List<Map<String, Object>> getSummeryData() {
    final  List<Map<String, Object>> summery = [];
    for (var i = 0; i < chosenAnswers.length;  i++) {
      summery.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summery;
  }

  @override
  Widget build(context) {
    final summaryData = getSummeryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
          return data['user_answer'] == data['correct_answer'];
    }).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              QuestionsSummary(getSummeryData()),
              const SizedBox(height: 30),
              
              TextButton.icon(
                  onPressed: onRestart,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Restart Quiz'))
              
            ],
          ),
      ),
    );
  }


}