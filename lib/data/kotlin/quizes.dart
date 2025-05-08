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
  QuizModel(
      question: 'Which of the following is a logical inverse operator:',
      answer: 1,
      options: [
        'inv()',
        '!',
        '&&',
        '||'
      ],
  ),
  QuizModel(
      question: 'Which of the following is true about Kotlin Boolean Data type?',
      answer: 0,
      options: [
        'Boolean data type can have two values true and false',
        'Boolean data type can have two values 0 and 1',
        'We can assign Boolean value to integer variable',
        'All of the above'
      ],
  ),
  QuizModel(
      question: 'Which of the following is true about Kotlin Arrays?',
      answer: 3,
      options: [
        'Kotlin arrays are capable to store all data types.',
        'Kotlin arrays can be created using either arrayOf() or arrayOfNulls() functions.',
        'Kotlin provides a rich set of properties and functions to manipulate arrays.',
        'All of the above'
      ],
  ),
  QuizModel(
      question: 'Which of the following is true about Control Flow Statement?',
      answer: 3,
      options: [
        'Control flow controls the execution of the program',
        'Loops and Decision Statements are part of control flow',
        'Control flow is an essential part of modern programming languages',
        'All of the above'
      ],
  ),
  QuizModel(
      question: 'Which of the following is true about Kotlin if expression?',
      answer: 3,
      options: [
        'Kotlin support traditional if...else expression.',
        'Kotlin if...else expression can be nested.',
        'Kotlin if...else expression returns a value which can be assigned to a variable.',
        'All of the above'
      ],
  ),
  QuizModel(
      question: 'Which of the following is not supported by Kotlin?',
      answer: 1,
      options: [
        'if...else if...else',
        'if...then...else',
        'if...else...',
        'None of the above'
      ],
  ),
];
