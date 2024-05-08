import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:online_course_app/feature/auth/domain/repository/user_repository.dart';
import 'package:online_course_app/feature/auth/domain/usecases/set_id_last_progress_course/set_id_last_progress_course_param.dart';
import '../../../../../core/usecase/usecase.dart';

class SetIdLastProgressCourseUseCase extends UseCase<Either<Failure, String>, SetIdLastProgressCourseParam> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  SetIdLastProgressCourseUseCase(this._authRepository, this._userRepository);

  @override
  Future<Either<Failure, String>> call({SetIdLastProgressCourseParam? params})  async {
    String? loggedInUser = _authRepository.getLoggedInUserId();
    if (loggedInUser != null && params != null) {
        var resultSetIdLastProgressCourse = await _userRepository.setIdLastProgressCourse(uid: loggedInUser, idEnrolledCourse: params.idLastProgressCourse);
       return  resultSetIdLastProgressCourse.fold((failure) => Left(failure), (data) => const Right("Success to set last progress"));
    } else {
      return Left(Failure(message: 'No user logged in'));
    }
  }
}
