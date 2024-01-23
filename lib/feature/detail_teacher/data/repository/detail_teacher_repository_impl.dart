import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/type_defs.dart';
import '../../../../core/resources/failure.dart';
import '../../../course/domain/entities/course.dart';
import '../../domain/repository/detail_teacher_repository.dart';
import '../data_source/firebase_detail_teacher_service.dart';

class DetailTeacherRepositoryImpl implements DetailTeacherRepository {
  final FirebaseDetailTeacherService _courseService;

  DetailTeacherRepositoryImpl(this._courseService);

  @override
  FutureEither<List<Course>> getCoursesByTeacher(String id)async {
    final result = await _courseService.getCoursesByTeacher(id);
    if (result.isSuccess) {
      return Right(result.resultValue!.map((model) => model.toEntity()).toList());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }


}
