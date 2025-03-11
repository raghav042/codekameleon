import 'package:codekameleon/data/c++/course.dart';
import 'package:codekameleon/data/c/course.dart';
import 'package:codekameleon/data/java/course.dart';
import 'package:codekameleon/data/javascript/course.dart';
import 'package:codekameleon/data/kotlin/course.dart';
import 'package:codekameleon/data/swift/course.dart';
import 'package:codekameleon/preferences/preferences.dart';

import '../data/dart/course.dart';
import '../model/course_model.dart';

class CourseHelper {
  const CourseHelper._();

  static CourseModel? get recentCourse {
    final String? recentCourseName = Preferences.getRecentCourse();
    if (recentCourseName == null) return null;
    return _courses.firstWhere((e) => e.name == recentCourseName);
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
