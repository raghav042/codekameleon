import 'package:codekameleon/constant/courses.dart';
import 'package:codekameleon/widgets/course_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class CourseGrid extends StatelessWidget {
  const CourseGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: List.generate(courses.length, (i) {
        return StaggeredGridTile.count(
          crossAxisCellCount: i == 0 ? 4 : 2,
          mainAxisCellCount: 1.8,
          child: CourseTile(course: courses[i]),
        );
      }),
    );
  }
}
