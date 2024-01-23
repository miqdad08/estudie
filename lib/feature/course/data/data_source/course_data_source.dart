import 'package:online_course_app/feature/course/data/models/teacher/teacher.dart';

import '../../../../core/resources/result.dart';
import '../models/course/course.dart';

abstract class CourseDataSource {
  Future<Result<List<CourseModel>>> getCourses();
  Future<Result<List<TeacherModel>>> getTeachers();
}
