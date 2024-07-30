import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/type_defs.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/video.dart';
import 'package:online_course_app/feature/enrolled_course/data/data_source/enrolled_course_data_source.dart';
import 'package:online_course_app/feature/enrolled_course/data/model/enrolled_course.dart';

import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';

import '../../../../core/resources/failure.dart';
import '../../domain/repository/enrolled_course_repository.dart';

class EnrolledCourseRepositoryImpl implements EnrolledCourseRepository {
  final EnrolledCourseDataSource _enrolledCourseDataSource;

  EnrolledCourseRepositoryImpl(this._enrolledCourseDataSource);

  @override
  FutureEither<EnrolledCourseEntity> createEnrolledCourse({required EnrolledCourseEntity enrolledCourse}) async{
    final result = await _enrolledCourseDataSource.createEnrolledCourse(enrolledCourse: EnrolledCourseModel.fromEntity(enrolledCourse));
    if (result.isSuccess) {
      return Right(result.resultValue!.toEntity());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEither<List<EnrolledCourseEntity>> getUserEnrolledCourse({required String uid}) async{
    final result = await _enrolledCourseDataSource.getUserEnrolledCourse(uid: uid);
    if (result.isSuccess) {
      return Right(result.resultValue!.map((data) => data.toEntity()).toList());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEither<EnrolledCourseEntity> getEnrolledCourseDetail({required String uid, required String id}) async{
    final result = await _enrolledCourseDataSource.getEnrolledCourseDetail(uid: uid, id: id);
    if (result.isSuccess) {
      return Right(result.resultValue!.toEntity());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEither<EnrolledCourseEntity> setIsDoneVideo({required EnrolledCourseEntity course, Video? video}) async{
    final result = await _enrolledCourseDataSource.setIsDoneVideo(course: EnrolledCourseModel.fromEntity(course));
    if (result.isSuccess) {
      return Right(result.resultValue!.toEntity());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEither<EnrolledCourseEntity> getLastProgressCourse({required String idLastProgressCourse}) async{
    final result = await _enrolledCourseDataSource.getLastProgressCourse(idLastProgressCourse: idLastProgressCourse);
    if (result.isSuccess) {
      return Right(result.resultValue!.toEntity());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }
}