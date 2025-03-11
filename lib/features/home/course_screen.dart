import 'package:flutter/material.dart';
import '../../model/course_model.dart';
import 'tutorial_screen.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.color, required this.course});
  final Color color;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
        actions: [
          Image.asset(course.smallIcon, height: 28),
        ],
      ),
      body: ListView.separated(
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
                      color: color,
                    ),
                  ));
            },
            contentPadding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
            leading: Text(
              "${index + 1}",
              style: const TextStyle(fontSize: 14),
            ),
            title: Text(course.tutorials[index].title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.access_time_rounded,
                  size: 16,
                  //color: scheme.onSurface,
                ),
                const SizedBox(width: 6),
                Text(
                  course.tutorials[index].duration,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    //color: scheme.onSurface,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 8),
      ),
    );
  }
}
