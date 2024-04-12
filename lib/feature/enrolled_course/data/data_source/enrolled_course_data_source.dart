import 'package:online_course_app/feature/enrolled_course/data/model/enrolled_course.dart';

import '../../../../core/resources/result.dart';
import '../../../detail_course/domain/entities/video.dart';

abstract class EnrolledCourseDataSource {
  Future<Result<EnrolledCourseModel>> createEnrolledCourse({
    required EnrolledCourseModel enrolledCourse,
  });

  Future<Result<List<EnrolledCourseModel>>> getUserEnrolledCourse({
    required String uid,
  });

  Future<Result<EnrolledCourseModel>> getEnrolledCourseDetail({
    required String uid,
    required String id,
  });

  Future<Result<EnrolledCourseModel>> setIsDoneVideo({
    required EnrolledCourseModel course,
    Video? video,
  });
}
