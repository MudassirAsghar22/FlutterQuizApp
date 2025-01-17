
import 'package:advance_basics/question_identifier.dart';
import 'package:advance_basics/summary_item.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {

    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
                  (data) {
            return SummaryItem(data);
          }).toList(),
          )
      ),
    );
  }
}