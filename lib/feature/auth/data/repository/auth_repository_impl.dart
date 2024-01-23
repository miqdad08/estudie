import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/resources/type_defs.dart';
import 'package:online_course_app/feature/auth/data/data_sources/auth_data_source.dart';

import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authService;

  AuthRepositoryImpl(this._authService);

  @override
  String? getLoggedInUserId() => _authService.getLoggedInUserId();

  @override
  FutureEither<String> login({
    required String email,
    required String password,
  }) async {
    final result = await _authService.login(email: email, password: password);
    if (result.isSuccess) {
      return Right(result.resultValue!);
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEitherVoid logout() async {
    final result = await _authService.logout();
    if (result.isSuccess) {
      return const Right(null);
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEither<String> register({
    required String email,
    required String password,
  }) async {
    final result =
        await _authService.register(email: email, password: password);
    if (result.isSuccess) {
      return Right(result.resultValue!);
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }
}
