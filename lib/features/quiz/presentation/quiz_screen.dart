import 'dart:developer';

import 'package:codekameleon/features/quiz/domain/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:codekameleon/extension/context_extension.dart';

import '../../../model/language_model.dart';
import '../../../model/quiz_model.dart';
import '../../../widgets/no_data_widget.dart';
import '../domain/quiz_cubit.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.language});
  final LanguageModel language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${language.name} Quiz"),
        actions: [
          BlocBuilder<QuizCubit, QuizState>(
            builder: (context, state) => Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'Score: ${state.totalScore}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: language.quizes.isEmpty
          ? const NoDataWidget(
              imagePath: "assets/images/no_data.svg",
              title: "No Quiz Found",
            )
          : _buildQuizContent(context),
    );
  }

  Widget _buildQuizContent(BuildContext context) {
    final colorScheme = context.colorScheme;
    final cubit = context.read<QuizCubit>();

    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 500,
              width: double.infinity,
              child: AppinioSwiper(
                controller: cubit.swiperController,
                cardCount: language.quizes.length,
                onSwipeEnd: (previousIndex, targetIndex, activity) {
                  if (targetIndex != -1) {
                    // cubit.checkAnswer(t);
                    cubit.updateIndex(targetIndex);
                  }
                },
                cardBuilder: (context, index) {
                  final quiz = language.quizes[index];
                  return _buildQuizCard(quiz, index, colorScheme, state, cubit);
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // if (cubit.isBack())
                  ElevatedButton(
                    onPressed: cubit.isBack() ? cubit.goBack : null,
                    child: const Text('Previous'),
                  ),
                  // if (state.mainIndex < language.quizes.length - 1)
                  ElevatedButton(
                    onPressed: state.mainIndex < language.quizes.length - 1
                        ? () {
                            cubit.swiperController.swipeLeft();
                            // cubit.next();
                          }
                        : null,
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildQuizCard(
    QuizModel quiz,
    int index,
    ColorScheme colorScheme,
    QuizState state,
    QuizCubit cubit,
  ) {
    final isSelected = state.selectedAnswers.containsKey(index);
    final selectedAnswer = state.selectedAnswers[state.mainIndex];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
            color: isSelected
                ? colorScheme.primary.withValues(alpha: 0.5)
                : colorScheme.tertiary.withValues(alpha: 0.5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quiz.question,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _buildOptions(
                quiz, index, colorScheme, selectedAnswer, cubit, state),
          ),
        ],
      ),
    );
  }

  Widget _buildOptions(QuizModel quiz, int quizIndex, ColorScheme colorScheme,
      String? selectedAnswer, QuizCubit cubit, QuizState state) {
    return ListView.builder(
      // shrinkWrap: true,
      itemCount: quiz.options.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final option = quiz.options[index];
        final isSelected = selectedAnswer == option;
        // final isCorrectAnswer = option == quiz.options[quiz.answer];
        return InkWell(
          onTap: () {
            log("the bool ${state.selectedAnswers}a nd $index");
            if (!state.selectedAnswers.containsKey(state.mainIndex)) {
              cubit.updateSelectedAnswer(option);
            } else {
              log("the  else ${state.selectedAnswers}");
            }
          },
          child: Material(
            color: Colors.transparent,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  selected: isSelected,
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
                    child: quiz.options.indexOf(state
                                    .selectedAnswers[state.currentIndex]
                                    .toString()) ==
                                quiz.answer &&
                            (index == quiz.answer)
                        ? Icon(
                            Icons.check,
                            color: Colors.green.shade700,
                          )
                        : Text((index + 1).toString()),
                  ),
                  title: Text(
                    option,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              )
            ] //   },
                    // ),
                    ),
          ),
        );

        // return Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 4.0),
        //   child: ListTile(
        //     onTap: () => cubit.updateSelectedAnswer(option),
        //     selected: isSelected,
        //     selectedColor: colorScheme.onPrimary,
        //     textColor: colorScheme.onPrimaryContainer,
        //     tileColor: quizIndex % 2 == 0
        //         ? colorScheme.primaryContainer
        //         : colorScheme.tertiaryContainer,
        //     selectedTileColor:
        //         quizIndex % 2 == 0 ? colorScheme.primary : colorScheme.tertiary,
        //     contentPadding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
        //     leading: CircleAvatar(
        //       backgroundColor: colorScheme.surfaceContainerLow,
        //       child: isSelected
        //           ? Icon(Icons.check, color: Colors.green.shade700)
        //           : Text('${index + 1}'),
        //     ),
        //     title: Text(option, style: const TextStyle(fontSize: 16)),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //   ),
        // );
      },
    );
  }
}
