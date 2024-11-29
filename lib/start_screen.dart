import 'package:advance_basics/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class StartScreen extends StatelessWidget {

  const StartScreen(this.startQuiz ,{super.key});

  final  void Function() startQuiz;

  @override
  Widget build(context) {
    // TODO: implement build
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: Colors.white,
            ),
            const SizedBox(height: 20),

            const StyledText('Learn flutter the fun way!'),

            const SizedBox(height: 20),

            OutlinedButton.icon(onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
            ),
              icon: const Icon(
                Icons.arrow_right_alt
              ),
              label: const Text('Start Quiz'),
            ),
          ],
        ),
    );
  }
}
