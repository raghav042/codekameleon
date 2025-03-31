// import 'package:equatable/equatable.dart';
//
// class QuizState extends Equatable {
//   final int currentIndex;
//   final Map<int, String?> selectedAnswers;
//   final int totalScore;
//   final int mainIndex;
//
//   const QuizState({
//     this.currentIndex = 0,
//     this.selectedAnswers = const {},
//     this.totalScore = 0,
//     this.mainIndex = 0,
//   });
//
//   QuizState copyWith({
//     int? currentIndex,
//     Map<int, String?>? selectedAnswers,
//     int? totalScore,
//     int? mainIndex,
//   }) {
//     return QuizState(
//       currentIndex: currentIndex ?? this.currentIndex,
//       selectedAnswers: selectedAnswers ?? this.selectedAnswers,
//       totalScore: totalScore ?? this.totalScore,
//       mainIndex: mainIndex ?? this.mainIndex,
//     );
//   }
//
//   @override
//   List<Object?> get props =>
//       [currentIndex, selectedAnswers, totalScore, mainIndex];
// }
