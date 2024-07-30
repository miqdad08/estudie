import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/usecase/usecase.dart';
import 'package:online_course_app/feature/course/domain/entities/course.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/detail_course.dart';
import 'package:online_course_app/feature/detail_course/domain/repository/detail_course_repository.dart';

import '../../../auth/domain/repository/auth_repository.dart';

class GetDetailCourseUseCase
    extends UseCase<Either<Failure, DetailCourse>, Course> {
  final DetailCourseRepository repository;
  final AuthRepository _authRepository;

  GetDetailCourseUseCase(this.repository, this._authRepository);

  @override
  Future<Either<Failure, DetailCourse>> call({Course? params}) async{
    String? loggedInUser = _authRepository.getLoggedInUserId();
    if(loggedInUser != null){
      return await repository.getCourseDetail(params!, loggedInUser);
    }else{
      return Left(Failure(message: 'Failed'));
    }
  }
}
