import 'package:flutter/material.dart';
import '../../model/language_model.dart';
import 'tutorial_screen.dart';

class TutorialTab extends StatelessWidget {
  const TutorialTab({super.key, required this.course});
  final LanguageModel course;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: true,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      itemCount: course.tutorials.length,
      itemBuilder: (_, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TutorialScreen(
                    tutorial: course.tutorials[index],
                    syntax: course.syntax,
                    iconPath: course.smallIcon,
                    color: course.color,
                  ),
                ));
          },
          contentPadding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
          title: Text(course.tutorials[index].title),
          trailing: Text(
            course.tutorials[index].duration,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 8),
    );
  }
}
