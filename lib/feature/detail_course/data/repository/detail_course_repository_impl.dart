import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/resources/type_defs.dart';

import 'package:online_course_app/feature/detail_course/domain/entities/detail_course.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/discussion.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/review.dart';
import '../../../course/domain/entities/course.dart';
import '../../domain/repository/detail_course_repository.dart';
import '../data_source/detail_course_data_source.dart';
import '../model/detail_course.dart';
import '../model/discussion.dart';
import '../model/review.dart';

class DetailCourseRepositoryImpl implements DetailCourseRepository {
  final DetailDataSource _firebaseDetailCourseService;

  DetailCourseRepositoryImpl(this._firebaseDetailCourseService);

  @override
  FutureEither<DetailCourse> getCourseDetail(Course course) async {
    final result = await _firebaseDetailCourseService.getDetailCourse(course.id);
    final resultReviews = await _firebaseDetailCourseService.getReviews(course.id);
    final resultLessons = await _firebaseDetailCourseService.getLessons(course.id);
    final resultDiscussion = await _firebaseDetailCourseService.getDiscussions(course.id);
    final resultTeacher = await _firebaseDetailCourseService.getTeacher(teacherId: course.idTeacher);
    if (result.isSuccess &&
        resultReviews.isSuccess &&
        resultLessons.isSuccess &&
        resultDiscussion.isSuccess) {
      return Right(result.resultValue!
          .copyWith(
        teacher: resultTeacher.resultValue,
        reviews: resultReviews.resultValue,
        lessons: resultLessons.resultValue,
        discussions: resultDiscussion.resultValue,
      )
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

  @override
  FutureEither<DetailCourse> unlockCourse(
      {required DetailCourse detailCourse, Course? course}) async {
    final result = await _firebaseDetailCourseService.unlockCourse(
        detailCourse: DetailCourseModel.fromEntity(detailCourse));
    if (result.isSuccess && course != null) {
      final resultTeacher = await _firebaseDetailCourseService.getTeacher(teacherId: course.idTeacher);
      if(resultTeacher.isSuccess){
        return Right(result.resultValue!.copyWith(teacher: resultTeacher.resultValue).toEntity());
      }else{
        return Left(Failure(message: result.errorMessage!));
      }
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }
}