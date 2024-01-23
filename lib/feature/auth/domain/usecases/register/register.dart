import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/common_util/extensions/data_value.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:online_course_app/feature/auth/domain/repository/user_repository.dart';
import 'package:online_course_app/feature/auth/domain/usecases/register/register_params.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../entities/user.dart';

class Register extends UseCase<Either<Failure, User>, RegisterParams> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  Register({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository;

  @override
  Future<Either<Failure, User>> call({RegisterParams? params}) async {
    var uidResult = await _authRepository.register(
        email: params!.email, password: params.password);
    if (uidResult.isRight()) {
      var userResult = await _userRepository.createUser(
        uid: uidResult.asRight(),
        email: params.email,
        name: params.name,
        photoUrl: params.photoUrl,
      );
      if (userResult.isRight()) {
        return Right(userResult.asRight());
      } else {
        return Left(userResult.asLeft());
      }
    } else {
      return Left(uidResult.asLeft());
    }
  }
}
