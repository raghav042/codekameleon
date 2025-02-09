import 'package:codekameleon/helper/course_helper.dart';
import 'package:codekameleon/widgets/course_tile.dart';
import 'package:codekameleon/widgets/heading.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8,
                ),
                child: SearchAnchor.bar(
                  barHintText: "Search anything",
                  suggestionsBuilder: (_, c) {
                    return [];
                  },
                ),
              ),
              const Heading(title: "Quizes"),
              SizedBox(
                height: 180,
                child: CarouselView(
                  itemExtent: 300,
                  children: List.generate(
                    7,
                    (i) => ColoredBox(color: colorScheme.tertiaryContainer),
                  ),
                ),
              ),
              if (CourseHelper.recentCourse != null)
                const Heading(title: "Currently Learning"),
              if (CourseHelper.recentCourse != null)
                CourseTile(
                  course: CourseHelper.recentCourse!,
                  isRecentCourse: true,
                ),
              const Heading(title: "Other Tutorials"),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                ),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: CourseHelper.courses.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) {
                  return CourseTile(course: CourseHelper.courses[i]);
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
