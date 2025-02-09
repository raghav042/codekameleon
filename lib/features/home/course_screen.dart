import 'package:codekameleon/features/home/tutorial_screen.dart';
import 'package:flutter/material.dart';
import '../../model/course_model.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.scheme, required this.course});
  final ColorScheme scheme;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${course.name} Tutorials"),
        actions: [
          Image.asset(course.smallIcon, height: 30),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView.separated(
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
                            scheme: scheme,
                          )));
            },
            contentPadding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
            tileColor: scheme.primaryContainer,
            leading: Text(
              "${index + 1}",
              style: const TextStyle(fontSize: 14),
            ),
            title: Text(course.tutorials[index].title),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                color: scheme.surface,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    size: 16,
                    color: scheme.primary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    course.tutorials[index].duration,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: scheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 8),
      ),
    );
  }
}
