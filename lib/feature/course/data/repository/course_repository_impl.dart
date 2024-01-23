import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/resources/type_defs.dart';

import 'package:online_course_app/feature/course/domain/entities/course.dart';

import 'package:online_course_app/feature/course/domain/entities/teacher.dart';

import '../../domain/repository/course_repository.dart';
import '../data_source/firebase_course_service.dart';

class CourseRepositoryImpl implements CourseRepository {
  final FirebaseCourseService _courseService;

  CourseRepositoryImpl(this._courseService);

  @override
  FutureEither<List<Course>> getCourses() async {
    final result = await _courseService.getCourses();
    if (result.isSuccess) {
      return Right(result.resultValue!.map((model) => model.toEntity()).toList());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEither<List<Teacher>> getTeachers() async {
    final result = await _courseService.getTeachers();
    if (result.isSuccess) {
      return Right(result.resultValue!.map((model) => model.toEntity()).toList());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }
}
