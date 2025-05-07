import '../../model/quiz_model.dart';

const List<QuizModel> javaScriptQuizzes = [
  QuizModel(
    question: 'What is JavaScript primarily used for?',
    answer: 1,
    options: [
      'Database management',
      'Web development',
      'Machine learning',
      'Operating system development'
    ],
  ),
  QuizModel(
    question: 'Which keyword is used to declare a variable in JavaScript?',
    answer: 0,
    options: [
      'var',
      'int',
      'let',
      'define',
    ],
  ),
  QuizModel(
    question: 'How do you define a function in JavaScript?',
    answer: 2,
    options: [
      'function myFunction = () => {};',
      'def myFunction() {};',
      'function myFunction() {};',
      'fn myFunction() {}'
    ],
  ),
  QuizModel(
    question: 'Which operator is used for strict equality comparison in JavaScript?',
    answer: 0,
    options: ['===', '==', '!=', '='],
  ),
  QuizModel(
    question: 'What does the `typeof` operator do in JavaScript?',
    answer: 1,
    options: [
      'Checks if a variable is defined',
      'Returns the type of a variable',
      'Converts a variable to a string',
      'Deletes a variable'
    ],
  ),
  QuizModel(
    question: 'Which object is used to handle asynchronous operations in JavaScript?',
    answer: 0,
    options: [
      'Promise',
      'Array',
      'Object',
      'Function'
    ],
  ),
  QuizModel(
    question: 'Which method is used to select an element in the DOM?',
    answer: 0,
    options: ['document.querySelector()', 'document.select()', 'document.getElement()', 'document.get()'],
  ),
  QuizModel(
    question: 'What is the purpose of the `JSON.parse()` method in JavaScript?',
    answer: 0,
    options: [
      'To convert a JSON string into a JavaScript object',
      'To stringify a JavaScript object into JSON',
      'To execute a JSON file',
      'To save a JSON object'
    ],
  ),
  QuizModel(
    question: 'Which function is used to execute a function after a specified delay in JavaScript?',
    answer: 0,
    options: ['setTimeout()', 'setInterval()', 'delay()', 'wait()'],
  ),
  QuizModel(
    question: 'What is event delegation in JavaScript?',
    answer: 0,
    options: [
      'A technique to efficiently handle events for multiple elements',
      'A way to send data between JavaScript functions',
      'A method for fetching data from an API',
      'A built-in JavaScript function for optimizing performance'
    ],
  ),
];
