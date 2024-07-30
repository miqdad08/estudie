import 'dart:io';

import 'package:online_course_app/core/resources/type_defs.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/discussion.dart';

import '../../../course/domain/entities/course.dart';
import '../entities/detail_course.dart';
import '../entities/review.dart';

abstract class DetailCourseRepository {
  FutureEither<DetailCourse> getCourseDetail(Course course, String uid);

  FutureEither<List<Discussion>> getDetailDiscussion(String id);

  FutureEither<Discussion> createDiscussion({
    required Discussion discussion,
    List<File>? fileAttachments,
    required String id,
  });

  FutureEither<Review> createReview({
    required Review review,
    required String id,
  });

  FutureEither<DetailCourse> unlockCourse({
    required DetailCourse detailCourse,
    Course? course,
  });
}
