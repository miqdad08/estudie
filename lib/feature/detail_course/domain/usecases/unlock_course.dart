import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/usecase/usecase.dart';
import 'package:online_course_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/detail_course.dart';
import 'package:online_course_app/feature/detail_course/domain/repository/detail_course_repository.dart';
import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';
import 'package:online_course_app/feature/enrolled_course/domain/repository/enrolled_course_repository.dart';

import '../../../course/domain/entities/course.dart';

class UnlockCourseParam {
  final DetailCourse detailCourse;
  final Course? course;

  UnlockCourseParam({required this.detailCourse, this.course});
}

class UnlockCourseUseCase
    extends UseCase<Either<Failure, DetailCourse>, UnlockCourseParam> {
  final DetailCourseRepository _repository;
  final EnrolledCourseRepository _enrolledCourseRepository;
  final AuthRepository _authRepository;

  UnlockCourseUseCase(
      this._repository, this._enrolledCourseRepository, this._authRepository);

  @override
  Future<Either<Failure, DetailCourse>> call(
      {UnlockCourseParam? params}) async {
    int enrolledCourseTime = DateTime.now().millisecondsSinceEpoch;
    String? loggedInUser = _authRepository.getLoggedInUserId();
    var result = await _repository.unlockCourse(
        detailCourse: params!.detailCourse.copyWith(isUnlock: true), course: params.course);
    return result.fold(
      (failure) => Left(failure),
      (data) async {
        var resultCreateEnrolledCourse =
            await _enrolledCourseRepository.createEnrolledCourse(
          enrolledCourse: EnrolledCourseEntity.fromCourse(
            params.course!.copyWith(
              id: 'idECrs-$enrolledCourseTime-$loggedInUser',
            ),
          ).copyWith(
            uid: loggedInUser,
            idCourse: params.course!.id,
            lessons: params.detailCourse.lessons,
          ),
        );
        return resultCreateEnrolledCourse.fold(
          (failure) => Left(failure),
          (dataEnrolledCourse) => Right(data),
        );
      },
    );
  }
}

// class UnlockCourseUseCase
//     extends UseCase<Either<Failure, DetailCourse>, DetailCourse> {
//   final DetailCourseRepository _repository;
//   final EnrolledCourseRepository _enrolledCourseRepository;
//
//   // final DetailCourseRepository repository;
//
//   UnlockCourseUseCase(this._repository, this._enrolledCourseRepository);
//
//   @override
//   Future<Either<Failure, DetailCourse>> call({ required DetailCourse detailCourseParamCourse? params}) async
// }
