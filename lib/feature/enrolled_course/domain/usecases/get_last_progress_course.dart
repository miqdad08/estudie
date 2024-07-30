import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';
import 'package:online_course_app/feature/enrolled_course/domain/repository/enrolled_course_repository.dart';

import '../../../../core/resources/failure.dart';
import '../../../../core/usecase/usecase.dart';

class GetLastProgressCourseUseCase
    extends UseCase<Either<Failure, EnrolledCourseEntity>, String> {
  final EnrolledCourseRepository repository;

  GetLastProgressCourseUseCase(this.repository);

  @override
  Future<Either<Failure, EnrolledCourseEntity>> call({String? params}) async {
    return await repository.getLastProgressCourse(idLastProgressCourse: params!);
  }
}
