import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/usecase/usecase.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/detail_course.dart';
import 'package:online_course_app/feature/detail_course/domain/repository/detail_course_repository.dart';

class GetDetailCourseUseCase
    extends UseCase<Either<Failure, DetailCourse>, String> {
  final DetailCourseRepository repository;

  GetDetailCourseUseCase(this.repository);

  @override
  Future<Either<Failure, DetailCourse>> call({String? params}) async {
    return await repository.getCourseDetail(params!);
  }
}
