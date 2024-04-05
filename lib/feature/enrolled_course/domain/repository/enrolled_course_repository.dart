import 'package:online_course_app/core/resources/type_defs.dart';

import '../entities/enrolled_course.dart';

abstract class EnrolledCourseRepository {
  FutureEither<EnrolledCourseEntity> createEnrolledCourse({
    required EnrolledCourseEntity enrolledCourse,
  });

  FutureEither<List<EnrolledCourseEntity>> getUserEnrolledCourse({
    required String uid,
  });
}