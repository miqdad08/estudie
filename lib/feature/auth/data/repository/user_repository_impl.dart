import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:online_course_app/core/resources/failure.dart';
import 'package:online_course_app/core/resources/type_defs.dart';
import 'package:online_course_app/feature/auth/domain/entities/user.dart';
import '../../domain/repository/user_repository.dart';
import '../data_sources/user_data_source.dart';
import '../models/user/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userService;

  UserRepositoryImpl(this._userService);

  @override
  FutureEither<User> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  }) async {
    final result = await _userService.createUser(
      uid: uid,
      email: email,
      name: name,
      photoUrl: photoUrl,
      balance: balance,
    );
    if (result.isSuccess) {
      return Right(result.resultValue!.toEntity());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEither<User> getUser({required String uid}) async {
    final result = await _userService.getUser(uid: uid);
    if (result.isSuccess) {
      return Right(result.resultValue!.toEntity());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEither<int> getUserBalance({required String uid}) async {
    final result = await _userService.getUserBalance(uid: uid);
    if (result.isSuccess) {
      return Right(result.resultValue!);
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEither<User> updateUser({required User user}) async {
    final result =
        await _userService.updateUser(user: UserModel.fromEntity(user));
    if (result.isSuccess) {
      return Right(result.resultValue!.toEntity());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEither<User> updateUserBalance({
    required String uid,
    required int balance,
  }) async {
    final result =
        await _userService.updateUserBalance(uid: uid, balance: balance);
    if (result.isSuccess) {
      return Right(result.resultValue!.toEntity());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }

  @override
  FutureEither<User> uploadProfilePicture({
    required User user,
    required File imageFile,
  }) async{
    final result =
        await _userService.uploadProfilePicture(user: UserModel.fromEntity(user), imageFile: imageFile);
    if (result.isSuccess) {
      return Right(result.resultValue!.toEntity());
    } else {
      return Left(Failure(message: result.errorMessage!));
    }
  }
}
