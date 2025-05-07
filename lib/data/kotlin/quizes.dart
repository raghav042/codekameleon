import 'package:codekameleon/model/quiz_model.dart';

const List<QuizModel> kotlinQuizzes = [
  QuizModel(
      question: 'Which of the following statement is correct in Kotlin?',
      answer: 0,
      options: [
        'A Kotlin program must have a main() function',
        'A Kotlin program can be compiled without a main() function',
        'It is mandatory to have a print() or println() functions in a Kotlin program',
        'All statements are correct from Kotlin programming point of view'
      ],
  ),
  QuizModel(
      question: 'Which of the following statements is correct about Kotlin Comments:',
      answer: 3,
      options: [
        'Kotlin comments are ignored by the compiler',
        'Kotlin comments helps programmer to increase the readability of the code',
        'Kotlin supports nested comments',
        'All of the above'
      ],
  ),
  QuizModel(
      question: ' What could be the length of a Kotlin Single-line comment:',
      answer: 2,
      options: [
        '256 characters',
        'Infinite',
        'Till the end of the line',
        'None of the above'
      ],
  ),
  QuizModel(
      question: 'What does the Kotlin operator % do?',
      answer: 3,
      options: [
        'It is used to divide a number by another number.',
        'Kotlin does not support any such operator',
        'This is bitwise XOR operator',
        'This is called modulus operator and returns the division remainder.'
      ],
  ),
  QuizModel(
      question: 'What does Kotlin operator ++ do?',
      answer: 2,
      options: [
        'It is used to add two values',
        'There is no any such operators like ++ in Kotlin',
        'This is called unary increment operator',
        'None of the above'
      ],
  ),
];
