import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:online_course_app/feature/auth/domain/repository/user_repository.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/user.dart';

class GetLoggedInUser extends UseCase<Either<Failure, User>, void> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  GetLoggedInUser(this._authRepository, this._userRepository);

  @override
  Future<Either<Failure, User>> call({void params}) async {
    String? loggedInUser = _authRepository.getLoggedInUserId();
    if (loggedInUser != null) {
      var userResult = await _userRepository.getUser(uid: loggedInUser);
      return userResult.fold((failure) => Left(failure), (data) => Right(data));
    } else {
      return Left(Failure(message: 'No user logged in'));
    }
  }
}
