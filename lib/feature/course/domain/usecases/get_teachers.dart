import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/usecase/usecase.dart';
import 'package:online_course_app/feature/course/domain/repository/course_repository.dart';

import '../entities/teacher.dart';


class GetTeachersUseCase extends UseCase<Either<Failure, List<Teacher>>, void>{
  final CourseRepository repository;

  GetTeachersUseCase(this.repository);

  @override
  Future<Either<Failure, List<Teacher>>> call({void params}) async{
    return await repository.getTeachers();
  }

}