import 'package:online_course_app/feature/enrolled_course/data/model/enrolled_course.dart';

import '../../../../core/resources/result.dart';

abstract class EnrolledCourseDataSource {
  Future<Result<EnrolledCourseModel>> createEnrolledCourse({
    required EnrolledCourseModel enrolledCourse,
  });

  Future<Result<List<EnrolledCourseModel>>> getUserEnrolledCourse({
    required String uid,
  });

}
