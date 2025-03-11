import 'package:codekameleon/model/course_model.dart';
import 'package:codekameleon/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../features/home/course_screen.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course});
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
        width: 170,
        //margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: course.color, //scheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(200),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              right: 0,
              child: Image.asset(course.largeIcon, height: 90),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      course.name,
                      maxLines: 2,
                      style: GoogleFonts.rajdhani(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.menu_book_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          course.tutorials.length.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "Tutorials",
                          style: TextStyle(
                            fontSize: 14,
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

/*
import 'package:codekameleon/model/course_model.dart';
import 'package:codekameleon/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../features/home/course_screen.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course});
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
        width: 170,
        //margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: course.color, //scheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(200),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: colorScheme.surface,
                child: CircleAvatar(
                  radius: 46,
                  backgroundColor: colorScheme.surface,
                  backgroundImage: AssetImage(course.largeIcon),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      course.name,
                      maxLines: 2,
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.menu_book_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          course.tutorials.length.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "Tutorials",
                          style: TextStyle(
                            fontSize: 14,
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

 */
