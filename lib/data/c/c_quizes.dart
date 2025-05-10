
import '../../model/quiz_model.dart';

const List<QuizModel> cQuizzes = [
  QuizModel(
    question: 'What is the purpose of the #include directive in C?',
    answer: 1,
    options: [
      'Define macros',
      'Include external libraries or header files',
      'Declare functions',
      'Specify the entry point of the program'
    ],
  ),
  QuizModel(
    question: 'What is the primary function in a C program?',
    answer: 0,
    options: [
      'main()',
      'init()',
      'start()',
      'execute()',
    ],
  ),
  QuizModel(
    question: 'What is the size of an int data type in C?',
    answer: 2,
    options: [
      '1 byte',
      '4 bytes',
      'Depends on the system/compiler',
      '8 bytes'
    ],
  ),
  QuizModel(
    question: 'Which function is used to read input from the user in C?',
    answer: 0,
    options: ['scanf()', 'input()', 'getchar()', 'read()'],
  ),
  QuizModel(
    question: 'What is the purpose of the malloc() function in C?',
    answer: 1,
    options: [
      'To allocate memory dynamically',
      'To free dynamically allocated memory',
      'To print to the console',
      'To assign values to variables'
    ],
  ),
  QuizModel(
    question: 'What is a pointer in C?',
    answer: 0,
    options: [
      'A variable that stores the memory address of another variable',
      'A variable that stores an integer value',
      'A function to handle memory allocation',
      'A special data type for mathematical operations'
    ],
  ),
  QuizModel(
    question: 'Which function is used to allocate memory on the heap in C?',
    answer: 0,
    options: ['malloc()', 'free()', 'realloc()', 'calloc()'],
  ),
  QuizModel(
    question: 'Which of the following is a valid data type in C?',
    answer: 0,
    options: ['int', 'float32', 'string', 'number'],
  ),
  QuizModel(
    question: 'What is the correct syntax for a for loop in C?',
    answer: 0,
    options: [
      'for (int i = 0; i < 10; i++) { }',
      'for (i = 0; i < 10; i++) { }',
      'for int i = 0 to 10 { }',
      'for (i < 10; i++) { }'
    ],
  ),
  QuizModel(
    question: 'What is the purpose of the return statement in C?',
    answer: 0,
    options: [
      'To exit a function and optionally return a value',
      'To declare variables inside a function',
      'To print the output to the console',
      'To define the program’s entry point'
    ],
  ),
];
