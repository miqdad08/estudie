import '../../../../core/resources/result.dart';

abstract class AuthDataSource {
  Future<Result<String>> login({
    required String email,
    required String password,
  });

  Future<Result<String>> register({
    required String email,
    required String password,
  });

  Future<Result<void>> logout();

  String? getLoggedInUserId();
}
