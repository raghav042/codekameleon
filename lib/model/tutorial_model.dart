class TutorialModel {
  const TutorialModel({
    required this.title,
    required this.description,
    required this.duration,
    this.updatedAt = "7 March 2025",
    required this.content,
  });

  final String title;
  final String description;
  final String duration;
  final String updatedAt;
  final String content;
}
