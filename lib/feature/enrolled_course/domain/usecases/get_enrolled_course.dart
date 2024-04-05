import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';
import 'package:online_course_app/feature/enrolled_course/domain/repository/enrolled_course_repository.dart';

import '../../../../core/resources/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/domain/repository/auth_repository.dart';

class GetEnrolledCoursesUseCase
    extends UseCase<Either<Failure, List<EnrolledCourseEntity>>, void> {
  final EnrolledCourseRepository repository;
  final AuthRepository authRepository;

  GetEnrolledCoursesUseCase(this.repository, this.authRepository);

  @override
  Future<Either<Failure, List<EnrolledCourseEntity>>> call({void params}) async {
    String? loggedInUser = authRepository.getLoggedInUserId();
    if (loggedInUser != null) {
      var data = await repository.getUserEnrolledCourse(uid: loggedInUser);
      return data.fold((failure) => Left(failure), (data) => Right(data));
    } else {
      return Left(Failure(message: 'No logged in user'));
    }
  }
}
