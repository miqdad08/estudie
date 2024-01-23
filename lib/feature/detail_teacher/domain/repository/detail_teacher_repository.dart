import 'package:online_course_app/core/resources/type_defs.dart';

import '../../../course/domain/entities/course.dart';

abstract class DetailTeacherRepository {
  FutureEither<List<Course>> getCoursesByTeacher(String id);
}
