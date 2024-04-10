import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';
import 'package:online_course_app/feature/enrolled_course/domain/repository/enrolled_course_repository.dart';

import '../../../../core/resources/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/domain/repository/auth_repository.dart';

class GetEnrolledCourseDetailUseCase
    extends UseCase<Either<Failure, EnrolledCourseEntity>, String> {
  final EnrolledCourseRepository repository;
  final AuthRepository authRepository;

  GetEnrolledCourseDetailUseCase(
      {required this.repository, required this.authRepository});

  @override
  Future<Either<Failure, EnrolledCourseEntity>> call({String? params}) async {
    String? loggedInUser = authRepository.getLoggedInUserId();
    if (loggedInUser != null) {
      var result = await repository.getEnrolledCourseDetail(
          uid: loggedInUser, id: params!);
      return result.fold(
        (failure) => Left(failure),
        (data) => Right(data),
      );
    }else{
      return Left(Failure(message: 'Detail not found'));
    }
  }
}
