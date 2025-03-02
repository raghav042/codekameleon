import 'package:codekameleon/helper/course_helper.dart';
import 'package:codekameleon/widgets/course_tile.dart';
import 'package:codekameleon/widgets/heading.dart';
import 'package:flutter/material.dart';

import '../../widgets/recent_course_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Heading(title: "Quizes"),
                SizedBox(
                  height: 170,
                  child: CarouselView(
                    itemExtent: 300,
                    children: List.generate(
                      7,
                      (i) => ColoredBox(color: colorScheme.surfaceContainer),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SearchAnchor.bar(
                          barElevation: const WidgetStatePropertyAll(0),
                          barHintText: "Search anything",
                          suggestionsBuilder: (_, c) {
                            return [];
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings_outlined),
                      ),
                    ],
                  ),
                ),
                if (CourseHelper.recentCourse != null)
                  const Heading(title: "Currently Learning"),
                if (CourseHelper.recentCourse != null)
                  RecentCourseTile(course: CourseHelper.recentCourse!),
                const Heading(title: "Popular Tutorials"),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: CourseHelper.courses.length,
                    itemBuilder: (_, i) =>
                        CourseTile(course: CourseHelper.courses[i]),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
