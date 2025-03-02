import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../features/home/course_screen.dart';
import '../model/course_model.dart';
import '../preferences/preferences.dart';

class RecentCourseTile extends StatelessWidget {
  const RecentCourseTile({super.key, required this.course});
  final CourseModel course;

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
          ),
        );
      },
      child: Container(
        height: 200,
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: course.color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                course.largeIcon,
                height: 150,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      course.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.menu_book_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          course.tutorials.length.toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "Tutorials",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
