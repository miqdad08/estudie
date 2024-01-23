import 'dart:io';

import 'package:online_course_app/feature/detail_course/data/model/discussion.dart';
import 'package:online_course_app/feature/detail_course/data/model/section.dart';

import '../../../../core/resources/result.dart';
import '../model/detail_course.dart';
import '../model/review.dart';

abstract class DetailDataSource {
  Future<Result<DetailCourseModel>> getDetailCourse(String id);

  Future<Result<List<ReviewModel>>> getReviews(String id);

  Future<Result<List<SectionModel>>> getLessons(String id);

  Future<Result<List<DiscussionModel>>> getDiscussions(String id);

  Future<Result<DiscussionModel>> createDiscussion(
    DiscussionModel discussion,
    String id,
  );

  Future<Result<ReviewModel>> createReview(
    ReviewModel review,
    String id,
  );

  Future<Result<List<String>>> uploadPhotoAttachments({
    required List<File> attachmentsFile,
    required String id,
  });
}
