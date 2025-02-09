import 'package:codekameleon/features/home/course_grid.dart';
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
              const Heading(title: "Currently Learning"),
              const SizedBox(
                height: 600,
                child: CourseGrid(),
              ),
              const Heading(title: "Other Tutorials"),
            ],
          ),
        ),
      ),
    );
  }
}
