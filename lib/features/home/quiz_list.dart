import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/features/quiz/domain/quiz_cubit.dart';
import 'package:codekameleon/features/quiz/quiz_result.dart';
import 'package:codekameleon/helper/ui_helper.dart';
import 'package:codekameleon/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/languages.dart';
import '../../widgets/heading.dart';
import '../quiz/presentation/quiz_screen.dart';

class QuizList extends StatelessWidget {
  const QuizList({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(title: "Quizes"),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: languages.length,
            itemBuilder: (_, i) {
              return OutlinedButton(
                onPressed: () {
                  final quizResult =
                      Preferences.getQuizResult(languages[i].name);
                  if (quizResult == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => QuizCubit(),
                          child: QuizScreen(language: languages[i]),
                        ),
                      ),
                    );
                  } else {
                    UiHelper.showGenericConfirmationDialog(
                      context: context,
                      title: "Quiz Already Taken",
                      message:
                          "You've already completed this quiz. Would you like to view your result?",
                      confirmText: "View Result",
                      onConfirmed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => QuizResultScreen(
                              language: languages[i],
                              result: quizResult,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
// onPressed: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>
                //               QuizScreen(language: languages[i])));
                // },
                style: OutlinedButton.styleFrom(
                  backgroundColor: colorScheme.surfaceContainerHigh,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      languages[i].smallIcon,
                      height: 45,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      languages[i].name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 15),
          ),
        ),
      ],
    );
  }
}
