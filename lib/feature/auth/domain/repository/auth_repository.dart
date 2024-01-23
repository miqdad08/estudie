import 'package:online_course_app/core/resources/type_defs.dart';

abstract class AuthRepository {
  FutureEither<String> register({
    required String email,
    required String password,
  });

  FutureEither<String> login({
    required String email,
    required String password,
  });

  FutureEitherVoid logout();

  String? getLoggedInUserId();
}
