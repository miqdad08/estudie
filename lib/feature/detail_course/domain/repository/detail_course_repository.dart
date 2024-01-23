import 'dart:io';

import 'package:online_course_app/core/resources/type_defs.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/discussion.dart';

import '../entities/detail_course.dart';
import '../entities/review.dart';

abstract class DetailCourseRepository {
  FutureEither<DetailCourse> getCourseDetail(String id);

  FutureEither<Discussion> createDiscussion({
    required Discussion discussion,
    List<File>? fileAttachments,
    required String id,
  });

  FutureEither<Review> createReview({
    required Review review,
    required String id,
  });
}
