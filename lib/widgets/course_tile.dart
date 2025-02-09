import 'package:codekameleon/model/course_model.dart';
import 'package:codekameleon/preferences/preferences.dart';
import 'package:flutter/material.dart';

import '../features/home/course_screen.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({
    super.key,
    required this.course,
    this.isRecentCourse = false,
  });
  final CourseModel course;
  final bool isRecentCourse;

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
              Preferences.saveRecentCourse(course.name);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseScreen(
                      scheme: scheme,
                      course: course,
                    ),
                  ));
            },
            child: Container(
              height: isRecentCourse ? 180 : 100,
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: isRecentCourse ? 20 : 0),
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      course.largeIcon,
                      width: isRecentCourse ? 150 : 80,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(isRecentCourse ? 20 : 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.name,
                          style: TextStyle(
                            color: scheme.primary,
                            fontSize: isRecentCourse ? 35 : 22,
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
                                fontSize: isRecentCourse ? 18 : 16,
                                fontWeight: FontWeight.bold,
                                color: scheme.onPrimaryContainer,
                              ),
                            ),
                            if (isRecentCourse) const SizedBox(width: 8),
                            if (isRecentCourse)
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
