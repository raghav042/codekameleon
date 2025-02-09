import 'package:codekameleon/model/course_model.dart';
import 'package:flutter/material.dart';

import '../features/home/course_screen.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course});
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return FutureBuilder(
        future: ColorScheme.fromImageProvider(
          provider: AssetImage(course.smallIcon),
        ),
        builder: (context, snapshot) {
          final scheme = snapshot.data ?? colorScheme;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CourseScreen(
                            scheme: scheme,
                            course: course,
                          )));
            },
            child: Container(
              height: 200,
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(course.largeIcon),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.name,
                          style: TextStyle(
                            color: scheme.primary,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.menu_book_rounded,
                              color: scheme.primary,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              course.tutorials.length.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: scheme.onPrimaryContainer,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Tutorials",
                              style: TextStyle(
                                fontSize: 16,
                                color: scheme.onPrimaryContainer,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
