import 'package:fpdart/fpdart.dart';

import '../../../../core/resources/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../course/domain/entities/course.dart';
import '../repository/detail_teacher_repository.dart';

class GetCoursesByTeacherUseCase extends UseCase<Either<Failure, List<Course>>, String> {
  final DetailTeacherRepository repository;

  GetCoursesByTeacherUseCase(this.repository);

  @override
  Future<Either<Failure, List<Course>>> call({String? params}) async {
    return await repository.getCoursesByTeacher(params!);
  }
}
