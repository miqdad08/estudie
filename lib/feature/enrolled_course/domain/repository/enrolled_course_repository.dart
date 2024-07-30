import 'package:online_course_app/core/resources/type_defs.dart';

import '../../../detail_course/domain/entities/video.dart';
import '../entities/enrolled_course.dart';

abstract class EnrolledCourseRepository {
  FutureEither<EnrolledCourseEntity> createEnrolledCourse({
    required EnrolledCourseEntity enrolledCourse,
  });

  FutureEither<List<EnrolledCourseEntity>> getUserEnrolledCourse({
    required String uid,
  });

  FutureEither<EnrolledCourseEntity> getEnrolledCourseDetail({
    required String uid,
    required String id,
  });

  FutureEither<EnrolledCourseEntity> setIsDoneVideo({
    required EnrolledCourseEntity course,
    Video? video,
  });

  FutureEither<EnrolledCourseEntity> getLastProgressCourse({
    required String idLastProgressCourse,
  });
}