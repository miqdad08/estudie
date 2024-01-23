import 'dart:io';

import 'package:online_course_app/core/resources/type_defs.dart';
import '../entities/user.dart';

abstract class UserRepository {
  FutureEither<User> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  });

  FutureEither<User> getUser({required String uid});

  FutureEither<User> updateUser({required User user});

  FutureEither<int> getUserBalance({required String uid});

  FutureEither<User> updateUserBalance({
    required String uid,
    required int balance,
  });

  FutureEither<User> uploadProfilePicture({
    required User user,
    required File imageFile,
  });
}
