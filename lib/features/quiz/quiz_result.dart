import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import '../../../model/language_model.dart';
import '../../../model/quiz_model.dart';
import '../../constant/app_strings.dart';

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
    final size = MediaQuery.of(context).size;
    final quizCount = language.quizes.length;
    final percentage = (totalScore / quizCount) * 100;

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
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.6,
                child: AppinioSwiper(
                  cardCount: language.quizes.length,
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
              SizedBox(
                height: 20,
              ),
              _buildScoreSummary(context, totalScore, quizCount, percentage),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreSummary(
      BuildContext context, int score, int total, double percentage) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Color resultColor;
    String resultMessage;

    if (percentage >= 80) {
      resultColor = Colors.amber;
      resultMessage = AppStrings.excellent;
    } else if (percentage >= 60) {
      resultColor = Colors.amber;
      resultMessage = AppStrings.goodJob;
    } else {
      resultColor = Colors.red;
      resultMessage = AppStrings.keepPracticing;
    }

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            resultMessage,
            style: textTheme.titleLarge?.copyWith(
              color: resultColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildScoreIndicator(
                context: context,
                score: score,
                total: total,
                percentage: percentage,
                color: resultColor,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Score: $score/$total",
                    style: textTheme.titleMedium,
                  ),
                  Text(
                    "${percentage.toStringAsFixed(0)}%",
                    style: textTheme.headlineMedium?.copyWith(
                      color: resultColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScoreIndicator({
    required BuildContext context,
    required int score,
    required int total,
    required double percentage,
    required Color color,
  }) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          CircularProgressIndicator(
            value: percentage / 100,
            strokeWidth: 8,
            backgroundColor: Colors.grey.withValues(alpha: 0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
          Center(
            child: Icon(
              percentage >= 60 ? Icons.emoji_events : Icons.school,
              color: color,
              size: 32,
            ),
          ),
        ],
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
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
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
                  tileColor = Colors.green.withValues(alpha: 0.2);
                } else if (isSelected) {
                  tileColor = Colors.red.withValues(alpha: 0.2);
                }

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: tileColor ?? colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isCorrectAns
                          ? Colors.green
                          : isSelected
                              ? Colors.red
                              : Colors.transparent,
                      width: 1.5,
                    ),
                    boxShadow: [
                      if (isSelected || isCorrectAns)
                        BoxShadow(
                          color: (isCorrectAns ? Colors.green : Colors.red)
                              .withValues(alpha: 0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                    leading: CircleAvatar(
                      backgroundColor: colorScheme.primaryContainer,
                      child: Text("${optIndex + 1}"),
                    ),
                    title: Text(
                      option,
                      style: TextStyle(
                        fontSize: 16,
                        color: isCorrectAns
                            ? Colors.green
                            : isSelected
                                ? Colors.red
                                : colorScheme.onSurface,
                      ),
                    ),
                    trailing: isCorrectAns
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : isSelected
                            ? const Icon(Icons.cancel, color: Colors.red)
                            : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
