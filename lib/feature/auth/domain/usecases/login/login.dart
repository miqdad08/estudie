import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/common_util/extensions/data_value.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:online_course_app/feature/auth/domain/repository/user_repository.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/user.dart';
import 'login_params.dart';

class Login extends UseCase<Either<Failure, User>, LoginParams> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  Login(
      {required AuthRepository authRepository,
      required UserRepository userRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository;

  @override
  Future<Either<Failure, User>> call({LoginParams? params}) async {
    var idResult = await _authRepository.login(
      email: params!.email,
      password: params.password,
    );
    if (idResult.isRight()) {
      var userResult = await _userRepository.getUser(uid: idResult.asRight());
      return userResult.fold(
        (failure) => Left(failure),
        (data) => Right(data),
      );
    } else {
      return Left(idResult.asLeft());
    }
  }
}
