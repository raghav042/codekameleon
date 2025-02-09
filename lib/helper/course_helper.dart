import 'package:codekameleon/data/c++/tutorials.dart';
import 'package:codekameleon/data/c/tutorials.dart';
import 'package:codekameleon/data/java/tutorials.dart';
import 'package:codekameleon/data/javascript/tutorials.dart';
import 'package:codekameleon/data/kotlin/tutorials.dart';
import 'package:codekameleon/data/swift/tutorials.dart';
import 'package:codekameleon/preferences/preferences.dart';

import '../data/dart/course.dart';
import '../model/course_model.dart';

class CourseHelper {
  const CourseHelper._();

  static CourseModel? get recentCourse {
    final String? recentCourseName = Preferences.getRecentCourse();
    return recentCourseName != null
        ? _courses.where((e) => e.name == recentCourseName).first
        : null;
  }

  static List<CourseModel> get courses {
    final String? recentCourseName = Preferences.getRecentCourse();

    if (recentCourseName == null) return _courses;
    return _courses.where((e) => e.name != recentCourseName).toList();
  }

  static const List<CourseModel> _courses = [
    cCourse,
    cppCourse,
    dartCourse,
    javaCourse,
    javascriptCourse,
    kotlinCourse,
    swiftCourse,
  ];
}
