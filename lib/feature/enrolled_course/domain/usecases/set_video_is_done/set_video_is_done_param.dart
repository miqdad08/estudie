import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';

import '../../../../detail_course/domain/entities/video.dart';

class SetVideoIsDoneParam{
  final EnrolledCourseEntity course;
  final Video video;

  SetVideoIsDoneParam({required this.course, required this.video});
}