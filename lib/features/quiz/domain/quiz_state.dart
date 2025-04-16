class QuizState {
  final int currentIndex;
  final int mainIndex;
  final int totalScore;
  final bool isSubmitted;
  final Map<int, String?> selectedAnswers;

  const QuizState({
    this.currentIndex = 0,
    this.mainIndex = 0,
    this.totalScore = 0,
    this.isSubmitted = false,
    this.selectedAnswers = const {},
  });

  QuizState copyWith({
    int? currentIndex,
    int? mainIndex,
    int? totalScore,
    bool? isSubmitted,
    Map<int, String?>? selectedAnswers,
  }) {
    return QuizState(
      currentIndex: currentIndex ?? this.currentIndex,
      mainIndex: mainIndex ?? this.mainIndex,
      totalScore: totalScore ?? this.totalScore,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
    );
  }
}
