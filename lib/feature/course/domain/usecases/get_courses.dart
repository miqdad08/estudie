import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/usecase/usecase.dart';
import 'package:online_course_app/feature/course/domain/repository/course_repository.dart';

import '../entities/course.dart';

class GetCoursesUseCase extends UseCase<Either<Failure, List<Course>>, void>{
  final CourseRepository repository;

  GetCoursesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Course>>> call({void params}) async{
    return await repository.getCourses();
  }

}