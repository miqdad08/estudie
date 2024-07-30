import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:online_course_app/core/resources/result.dart';
import 'package:online_course_app/core/resources/type_defs.dart';
import 'package:online_course_app/feature/auth/data/data_sources/user_data_source.dart';
import 'package:online_course_app/feature/auth/data/models/user/user.dart';
import 'package:path/path.dart';

class FirebaseUserService implements UserDataSource {
  final FirebaseFirestore _firestore;

  FirebaseUserService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<UserModel>> createUser(
      {required String uid,
      required String email,
      required String name,
      String? photoUrl,
      int balance = 0}) async {
    CollectionReference<Map<String, dynamic>> users =
        _firestore.collection('users');

    await users.doc(uid).set({
      'uid': uid,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'balance': balance,
    });

    DocumentSnapshot<Map<String, dynamic>> result = await users.doc(uid).get();
    if (result.exists) {
      return Result.success(UserModel.fromJson(result.data()!));
    } else {
      return const Result.failed('Failed to create user data');
    }
  }

  @override
  Future<Result<UserModel>> getUser({required String uid}) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          _firestore.doc('users/$uid');

      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();

      if (result.exists) {
        return Result.success(UserModel.fromJson(result.data()!));
      } else {
        return const Result.failed('User not found');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Failed to update user Data');
    }
  }

  @override
  Future<Result<int>> getUserBalance({required String uid}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firestore.doc('users/$uid');
    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();
    if (result.exists) {
      return Result.success(result.data()!['balance']);
    } else {
      return const Result.failed('User not found');
    }
  }

  @override
  Future<Result<UserModel>> updateUser({required UserModel user}) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          _firestore.doc('users/${user.uid}');
      await documentReference.update(user.toJson());
      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();
      if (result.exists) {
        UserModel updatedUser = UserModel.fromJson(result.data()!);
        if (updatedUser == user) {
          return Result.success(updatedUser);
        } else {
          return const Result.failed('Failed to update user');
        }
      } else {
        return const Result.failed('Failed to update user Data');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Failed to update user Data');
    }
  }

  @override
  Future<Result<UserModel>> updateUserBalance({
    required String uid,
    required int balance,
  }) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firestore.doc('users/$uid');

    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();

    if (result.exists) {
      await documentReference.update({'balance': balance});
      DocumentSnapshot<Map<String, dynamic>> updatedResult =
          await documentReference.get();
      if (updatedResult.exists) {
        UserModel updatedUser = UserModel.fromJson(updatedResult.data()!);
        if (updatedUser.balance == balance) {
          return Result.success(updatedUser);
        } else {
          return const Result.failed('Failed to update user balance');
        }
      } else {
        return const Result.failed('Failed to retrieve updated user balance');
      }
    } else {
      return const Result.failed('User not found');
    }
  }

  @override
  Future<Result<UserModel>> uploadProfilePicture({
    required UserModel user,
    required File imageFile,
  }) async {
    String fileName = basename(imageFile.path);
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    try {
      await reference.putFile(imageFile);
      String downloadUrl = await reference.getDownloadURL();
      var updateResult =
          await updateUser(user: user.copyWith(photoUrl: downloadUrl));
      if (updateResult.isSuccess) {
        return Result.success(updateResult.resultValue!);
      } else {
        return Result.failed(updateResult.errorMessage!);
      }
    } catch (e) {
      return const Result.failed('Failed to upload profile picture');
    }
  }

  @override
  Future<Result<UserModel>> setIdLastProgressCourse(
      {required String uid, required String idEnrolledCourse}) async {
    DocumentReference<Map<String, dynamic>> documentReference = _firestore.doc('users/$uid');

    DocumentSnapshot<Map<String, dynamic>> result = await documentReference.get();

    if (result.exists) {
      await documentReference.update({'idLastProgressCourse': idEnrolledCourse});
      DocumentSnapshot<Map<String, dynamic>> updatedResult = await documentReference.get();
      if (updatedResult.exists) {
        UserModel updatedUser = UserModel.fromJson(updatedResult.data()!);
        if (updatedUser.idLastProgressCourse == idEnrolledCourse) {
          return Result.success(updatedUser);
        } else {
          return const Result.failed('Failed to set id last progress course');
        }
      } else {
        return const Result.failed('Failed to set id last progress course');
      }
    } else {
      return const Result.failed('User not found');
    }
  }
}
