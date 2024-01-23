import 'dart:io';

import '../../../../core/resources/result.dart';
import '../models/user/user.dart';

abstract class UserDataSource {
  Future<Result<UserModel>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  });

  Future<Result<UserModel>> getUser({required String uid});

  Future<Result<UserModel>> updateUser({required UserModel user});

  Future<Result<int>> getUserBalance({required String uid});

  Future<Result<UserModel>> updateUserBalance({
    required String uid,
    required int balance,
  });

  Future<Result<UserModel>> uploadProfilePicture({
    required UserModel user,
    required File imageFile,
  });
}
