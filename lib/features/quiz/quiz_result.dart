import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import '../../../model/language_model.dart';
import '../../../model/quiz_model.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({
    super.key,
    required this.language,
    required this.result,
  });

  final LanguageModel language;
  final Map<String, dynamic> result;

  int _calculateScore() {
    int score = 0;
    for (var i = 0; i < language.quizes.length; i++) {
      final correct = language.quizes[i].options[language.quizes[i].answer];
      final selected = result[i.toString()];
      if (selected == correct) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final totalScore = _calculateScore();

    return Scaffold(
      appBar: AppBar(
        title: Text("${language.name} Result"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Score: $totalScore',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SizedBox(
          height: 400,
          child: AppinioSwiper(
            cardCount: language.quizes.length,
            // allowUnswipe: true,
            cardBuilder: (context, index) {
              final quiz = language.quizes[index];
              final selectedAnswer = result[index.toString()];
              final correctAnswer = quiz.options[quiz.answer];

              return _buildResultCard(
                quiz: quiz,
                index: index,
                selectedAnswer: selectedAnswer,
                correctAnswer: correctAnswer,
                colorScheme: colorScheme,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard({
    required QuizModel quiz,
    required int index,
    required String? selectedAnswer,
    required String correctAnswer,
    required ColorScheme colorScheme,
  }) {
    final isCorrect = selectedAnswer == correctAnswer;

    return Container(
      padding: const EdgeInsets.all(16),
      // height: 300,
      // width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isCorrect ? Colors.green : Colors.red,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Q${index + 1}: ${quiz.question}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quiz.options.length,
              itemBuilder: (context, optIndex) {
                final option = quiz.options[optIndex];
                final isSelected = selectedAnswer == option;
                final isCorrectAns = correctAnswer == option;

                Color? tileColor;
                if (isCorrectAns) {
                  tileColor = Colors.green.withOpacity(0.2);
                } else if (isSelected && !isCorrectAns) {
                  tileColor = Colors.red.withOpacity(0.2);
                }

                return ListTile(
                  tileColor: tileColor,
                  leading: CircleAvatar(
                    backgroundColor: colorScheme.surfaceContainerLow,
                    child: Text("${optIndex + 1}"),
                  ),
                  title: Text(option),
                  trailing: isCorrectAns
                      ? const Icon(Icons.check, color: Colors.green)
                      : isSelected
                          ? const Icon(Icons.close, color: Colors.red)
                          : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
