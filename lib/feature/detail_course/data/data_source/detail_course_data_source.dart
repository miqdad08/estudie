import 'dart:io';

import 'package:online_course_app/feature/detail_course/data/model/discussion.dart';

import '../../../../core/resources/result.dart';
import '../../../course/data/models/teacher/teacher.dart';
import '../../../course/domain/entities/course.dart';
import '../model/detail_course.dart';
import '../model/review.dart';
import '../model/video.dart';

abstract class DetailDataSource {
  Future<Result<DetailCourseModel>> getDetailCourse(String id);

  Future<Result<List<ReviewModel>>> getReviews(String id);

  Future<Result<List<VideoModel>>> getLessons(String id);

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

  Future<Result<DetailCourseModel>> unlockCourse({
    required DetailCourseModel detailCourse,
    Course? course,
  });

  Future<Result<TeacherModel>> getTeacher({
    required String teacherId,
  });

}
