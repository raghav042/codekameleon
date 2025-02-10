import 'package:codekameleon/model/course_model.dart';
import 'package:codekameleon/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return GestureDetector(
      onTap: () {
        Preferences.saveRecentCourse(course.name);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseScreen(
                color: course.color,
                course: course,
              ),
            ));
      },
      child: Container(
        height: isRecentCourse ? 170 : 100,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: isRecentCourse ? 16 : 0),
        decoration: BoxDecoration(
          color: course.color, //scheme.primary,
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
                    style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: isRecentCourse ? 40 : 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.menu_book_rounded,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        course.tutorials.length.toString(),
                        style: TextStyle(
                          fontSize: isRecentCourse ? 18 : 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      if (isRecentCourse) const SizedBox(width: 8),
                      if (isRecentCourse)
                        const Text(
                          "Tutorials",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
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
  }
}
