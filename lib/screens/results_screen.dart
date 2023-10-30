import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/summary_card.dart';
import '../data/dummy_data.dart';
import 'package:google_fonts/google_fonts.dart';

class ResulScreen extends StatelessWidget {
  const ResulScreen(
      {required this.anweredQuestion,
      required this.resultScreenOnTap,
      super.key});
  final List<String> anweredQuestion;
  final void Function() resultScreenOnTap;
  List<Map<String, Object>> quizSummary() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < questions.length; i++) {
      summary.add(
        {
          'QuestionNumber': i + 1,
          'Question': questions[i].question,
          'GivenAnswer': anweredQuestion[i],
          'CorrectAnswer': questions[i].answers[0]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = quizSummary();
    final totalQuestion = questions.length;
    final correctAnswers = summary
        .where((element) => element['GivenAnswer'] == element['CorrectAnswer'])
        .length;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $correctAnswers out of $totalQuestion Questions Correctly!',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 201, 153, 251),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              SummaryCard(summary: summary),
              const SizedBox(
                height: 30,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.rotate_right_sharp),
                onPressed: resultScreenOnTap,
                label: const Text("Restart Quiz"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
