import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/usecase/usecase.dart';
import 'package:online_course_app/feature/enrolled_course/domain/repository/enrolled_course_repository.dart';

import '../../../auth/domain/repository/auth_repository.dart';
import '../entities/enrolled_course.dart';

class CreateEnrolledCourseUseCase
    implements UseCase<Either<Failure, void>, EnrolledCourseEntity> {
  final AuthRepository authRepository;
  final EnrolledCourseRepository repository;

  CreateEnrolledCourseUseCase(this.authRepository, this.repository);

  @override
  Future<Either<Failure, void>> call({EnrolledCourseEntity? params}) async {
    int enrolledCourseTime = DateTime.now().millisecondsSinceEpoch;
    String? loggedInUser = authRepository.getLoggedInUserId();
    if (loggedInUser != null) {
      var result = await repository.createEnrolledCourse(
        enrolledCourse: params!.copyWith(
          id: 'idECrs-$enrolledCourseTime-$loggedInUser',
          uid: loggedInUser,
        ),
      );
      return result.fold(
        (failure) => Left(failure),
        (data) => const Right(null),
      );
    } else {
      return Left(Failure(message: 'No user logged in'));
    }
  }
}
