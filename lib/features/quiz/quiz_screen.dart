import 'package:codekameleon/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../model/language_model.dart';
import '../../model/quiz_model.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.language});
  final LanguageModel language;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = context.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("${language.name} Quiz"),
      ),

      // TODO : improve this code
      // body: CardSwiper(
      //   cardsCount: language.quizes.length,
      //   cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
      //     final quiz = language.quizes[index];
      //     return Container(
      //       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      //       width: double.maxFinite,
      //       // height: double.maxFinite,
      //       decoration: BoxDecoration(
      //         color: colorScheme.surfaceContainerLow,
      //         borderRadius: BorderRadius.circular(20),
      //         boxShadow: [
      //           BoxShadow(
      //             spreadRadius: 1,
      //             blurRadius: 3,
      //             offset: const Offset(0, 2),
      //             color: index % 2 == 0
      //                 ? colorScheme.primary.withValues(alpha: 0.5)
      //                 : colorScheme.tertiary.withValues(alpha: 0.5),
      //           )
      //         ],
      //       ),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             quiz.question,
      //             style: const TextStyle(fontSize: 18),
      //           ),
      //           options(quiz, index, colorScheme),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }

  Widget options(QuizModel quiz, int quizIndex, ColorScheme colorScheme) {
    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          quiz.options.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                selected: index == 2,
                selectedColor: colorScheme.onPrimary,
                textColor: colorScheme.onPrimaryContainer,
                tileColor: quizIndex % 2 == 0
                    ? colorScheme.primaryContainer
                    : colorScheme.tertiaryContainer,
                selectedTileColor: quizIndex % 2 == 0
                    ? colorScheme.primary
                    : colorScheme.tertiary,
                contentPadding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                leading: CircleAvatar(
                  backgroundColor: colorScheme.surfaceContainerLow,
                  child: index == 2
                      ? Icon(
                          Icons.check,
                          color: Colors.green.shade700,
                        )
                      : Text(index.toString()),
                ),
                title: Text(
                  quiz.options[index],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
