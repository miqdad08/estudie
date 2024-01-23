import 'package:online_course_app/core/resources/type_defs.dart';
import 'package:online_course_app/feature/course/domain/entities/course.dart';
import 'package:online_course_app/feature/course/domain/entities/teacher.dart';

abstract class CourseRepository {
  FutureEither<List<Course>> getCourses();
  FutureEither<List<Teacher>> getTeachers();
  // FutureEither<List<Teacher>> getLastProgress();
}