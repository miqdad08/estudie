import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_course_app/common_util/logger.dart';
import 'package:online_course_app/core/resources/result.dart';
import 'package:online_course_app/feature/auth/data/data_sources/firebase_user_service.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/video.dart';
import 'package:online_course_app/feature/enrolled_course/data/data_source/enrolled_course_data_source.dart';

import '../model/enrolled_course.dart';

class FirebaseEnrolledCourseService implements EnrolledCourseDataSource {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseEnrolledCourseService({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<List<EnrolledCourseModel>>> getUserEnrolledCourse(
      {required String uid}) async {
    firestore.CollectionReference<Map<String, dynamic>> enrolledCourses =
        _firebaseFirestore.collection('enrolledCourses');

    try {
      var result = await enrolledCourses.where('uid', isEqualTo: uid).get();
      if (result.docs.isNotEmpty) {
        return Result.success(result.docs
            .map((e) => EnrolledCourseModel.fromJson(e.data()))
            .toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return const Result.failed('Failed to get user transaction');
    }
  }

  @override
  Future<Result<EnrolledCourseModel>> createEnrolledCourse(
      {required EnrolledCourseModel enrolledCourse}) async {
    firestore.CollectionReference<Map<String, dynamic>> enrolledCourses =
        _firebaseFirestore.collection('enrolledCourses');
    try {
      var balanceResult =
          await FirebaseUserService().getUserBalance(uid: enrolledCourse.uid);

      if (balanceResult.isSuccess) {
        int previousBalance = balanceResult.resultValue!;
        if (previousBalance - enrolledCourse.total >= 0) {
          await enrolledCourses
              .doc(enrolledCourse.id)
              .set(enrolledCourse.toJson());

          var result = await enrolledCourses.doc(enrolledCourse.id).get();

          if (result.exists) {
            await FirebaseUserService().updateUserBalance(
              uid: enrolledCourse.uid,
              balance: previousBalance - enrolledCourse.total,
            );
            return Result.success(EnrolledCourseModel.fromJson(result.data()!));
          } else {
            return const Result.failed('Failed to create transaction data');
          }
        } else {
          return const Result.failed('Insufficient balance');
        }
      } else {
        return const Result.failed('Failed to create transaction data');
      }
    } catch (e) {
      if (e == FirebaseException) {
        return Result.failed(e.toString());
      } else {
        return const Result.failed('Failed to create transaction data');
      }
    }
  }

  @override
  Future<Result<EnrolledCourseModel>> getEnrolledCourseDetail(
      {required String uid, required String id}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc('enrolledCourses/$id');
    try {
      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();
      if (result.exists && result["uid"] == uid) {
        return Result.success(EnrolledCourseModel.fromJson(result.data()!));
      } else {
        return const Result.failed('Detail not found');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Detail not found');
    }
  }

  @override
  Future<Result<EnrolledCourseModel>> setIsDoneVideo(
      {required EnrolledCourseModel course, Video? video}) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          _firebaseFirestore.doc('enrolledCourses/${course.id}');
      await documentReference.update(course.toJson());
      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();
      if (result.exists) {
        LoggerUtils.loggerResponse(result.data());
        LoggerUtils.loggerResponse(course.toJson());
        LoggerUtils.loggerResponse(
            "isSame ${course.toJson() == result.data()}");
        EnrolledCourseModel updatedCourse =
            EnrolledCourseModel.fromJson(result.data()!);
        return Result.success(updatedCourse);
      } else {
        return const Result.failed('Failed to update set video 2');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Failed to update set video $e');
    }
  }
}
