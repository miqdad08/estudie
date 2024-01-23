import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/resources/type_defs.dart';

import 'package:online_course_app/feature/detail_course/domain/entities/detail_course.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/discussion.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/review.dart';
import '../../domain/repository/detail_course_repository.dart';
import '../data_source/detail_course_data_source.dart';
import '../model/discussion.dart';
import '../model/review.dart';

class DetailCourseRepositoryImpl implements DetailCourseRepository {
  final DetailDataSource _firebaseDetailCourseService;

  DetailCourseRepositoryImpl(this._firebaseDetailCourseService);

  @override
  FutureEither<DetailCourse> getCourseDetail(String id) async {
    final result = await _firebaseDetailCourseService.getDetailCourse(id);
    final resultReviews = await _firebaseDetailCourseService.getReviews(id);
    final resultLessons = await _firebaseDetailCourseService.getLessons(id);
    final resultDiscussion =
        await _firebaseDetailCourseService.getDiscussions(id);
    if (result.isSuccess &&
        resultReviews.isSuccess &&
        resultLessons.isSuccess &&
        resultDiscussion.isSuccess) {
      return Right(result.resultValue!
          .copyWith(
              reviews: resultReviews.resultValue,
              lessons: resultLessons.resultValue,
              discussions: resultDiscussion.resultValue)
          .toEntity());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEither<Discussion> createDiscussion({
    required Discussion discussion,
    List<File>? fileAttachments,
    required String id,
  }) async {
    List<String>? uploadAttachment;

    if (fileAttachments != null && fileAttachments.isNotEmpty) {
      final uploadAttachmentResult =
          await _firebaseDetailCourseService.uploadPhotoAttachments(
        attachmentsFile: fileAttachments,
        id: id,
      );

      if (uploadAttachmentResult.isSuccess) {
        uploadAttachment = uploadAttachmentResult.resultValue;
      } else {
        return Left(Failure(message: uploadAttachmentResult.errorMessage!));
      }
    }

    final result = await _firebaseDetailCourseService.createDiscussion(
      DiscussionModel.fromEntity(discussion.copyWith(
        photoAttachments: uploadAttachment,
      )),
      id,
    );

    if (result.isSuccess) {
      return Right(result.resultValue!.toEntity());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEither<Review> createReview(
      {required Review review, required String id}) async {
    final result = await _firebaseDetailCourseService.createReview(
      ReviewModel.fromEntity(review),
      id,
    );

    if (result.isSuccess) {
      return Right(result.resultValue!.toEntity());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }
}

// return Right(
// DetailCourse(
// id: 'id-${DateTime.now()}',
// previewVideo:
// 'https://www.youtube.com/watch?v=GQyWIur03aw&ab_channel=HeyFlutter%E2%80%A4com',
// lessons: const [
// Section(
// sectionName: 'Introduction',
// videos: [
// Video(
// name: 'Tools',
// videoUrl:
// 'https://www.youtube.com/watch?v=GQyWIur03aw&ab_channel=HeyFlutter%E2%80%A4com',
// isDone: true,
// ),
// Video(
// name: 'Software',
// videoUrl:
// 'https://www.youtube.com/watch?v=GQyWIur03aw&ab_channel=HeyFlutter%E2%80%A4com',
// isDone: true,
// ),
// Video(
// name: 'Eat',
// videoUrl:
// 'https://www.youtube.com/watch?v=GQyWIur03aw&ab_channel=HeyFlutter%E2%80%A4com',
// isDone: false,
// ),
// ],
// ),
// Section(
// sectionName: 'Learn',
// videos: [
// Video(
// name: 'Flutter',
// videoUrl:
// 'https://www.youtube.com/watch?v=GQyWIur03aw&ab_channel=HeyFlutter%E2%80%A4com',
// isDone: false,
// ),
// Video(
// name: 'Design',
// videoUrl:
// 'https://www.youtube.com/watch?v=GQyWIur03aw&ab_channel=HeyFlutter%E2%80%A4com',
// isDone: false,
// ),
// Video(
// name: 'Null Safety',
// videoUrl:
// 'https://www.youtube.com/watch?v=GQyWIur03aw&ab_channel=HeyFlutter%E2%80%A4com',
// isDone: true,
// ),
// ],
// ),
// ],
// reviews: [
// Review(
// nameUser: 'Miqdad',
// review: 'Keren',
// time: DateTime.now().millisecondsSinceEpoch,
// rating: 4,
// ),
// Review(
// nameUser: 'Karen',
// review: 'Cool',
// time: DateTime.now().millisecondsSinceEpoch,
// rating: 5,
// ),
// Review(
// nameUser: 'Shizuka',
// review:
// 'This is bad course ever cause i didnt get the knowledge on this course',
// time: DateTime(2023, 12, 22).millisecondsSinceEpoch,
// rating: 3.5,
// ),
// ],
// ),
// );
