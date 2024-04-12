import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:online_course_app/core/resources/result.dart';
import 'package:online_course_app/feature/course/data/models/teacher/teacher.dart';

import 'package:online_course_app/feature/detail_course/data/model/detail_course.dart';
import 'package:online_course_app/feature/detail_course/data/model/discussion.dart';
import 'package:online_course_app/feature/detail_course/data/model/review.dart';
import 'package:path/path.dart';

import '../../../course/domain/entities/course.dart';
import '../model/video.dart';
import 'detail_course_data_source.dart';

class FirebaseDetailCourseService implements DetailDataSource {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseDetailCourseService({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<DetailCourseModel>> getDetailCourse(String id) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc('details/$id');
    try {
      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();
      if (result.exists) {
        return Result.success(DetailCourseModel.fromJson(result.data()!));
      } else {
        return const Result.failed('Detail not found');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Detail not found');
    }
  }

  @override
  Future<Result<List<ReviewModel>>> getReviews(String id) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc('reviews/$id');
    try {
      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();
      if (result.exists) {
        return Result.success(List<ReviewModel>.from(
            result["reviews"]!.map((item) => ReviewModel.fromJson(item))));
      } else {
        return const Result.failed('Reviews not found');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Reviews not found');
    }
  }

  @override
  Future<Result<List<VideoModel>>> getLessons(String id) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc('lessons/$id');
    try {
      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();
      if (result.exists) {
        return Result.success(List<VideoModel>.from(
            result["lessons"]!.map((item) => VideoModel.fromJson(item))));
      } else {
        return const Result.failed('Lessons not found');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Lessons not found');
    }
  }

  @override
  Future<Result<List<DiscussionModel>>> getDiscussions(String id) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc('discussions/$id');
    try {
      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();

      if (result.exists) {
        return Result.success(List<DiscussionModel>.from(result["discussions"]!
            .map((item) => DiscussionModel.fromJson(item))));
      } else {
        return const Result.success([]);
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Discussions not found');
    }
  }

  @override
  Future<Result<DiscussionModel>> createDiscussion(
    DiscussionModel discussion,
    String id,
  ) async {
    CollectionReference<Map<String, dynamic>> discussions =
        _firebaseFirestore.collection('discussions');
    try {
      await discussions.doc(id).set({
        'discussions': FieldValue.arrayUnion([
          discussion.toJson(),
        ]),
      }, SetOptions(merge: false));
      var result = await discussions.doc(id).get();
      if (result.exists) {
        return Result.success(discussion);
      } else {
        return const Result.failed('Failed to create discussion data');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Failed to create discussion data ');
    }
  }

  ///Use imgbb for uploading image attachments
  // @override
  // Future<Result<List<String>>> uploadPhotoAttachments({
  //   required List<File> attachmentsFile,
  //   required String id,
  // }) async {
  //   try {
  //     List<String> fileNames =
  //         attachmentsFile.map((photo) => basename(photo.path)).toList();
  //     List<Reference> references = fileNames
  //         .map((fileName) => FirebaseStorage.instance.ref().child(fileName))
  //         .toList();
  //     List<String> urlPhotos = [];
  //     for (int i = 0; i < attachmentsFile.length; i++) {
  //       await references[i].putFile(attachmentsFile[i]);
  //       String downloadUrl = await references[i].getDownloadURL();
  //       urlPhotos.add(downloadUrl);
  //     }
  //     return Result.success(urlPhotos);
  //   } catch (e) {
  //     return const Result.failed('Failed to upload photo attachments');
  //   }
  // }

  @override
  Future<Result<List<String>>> uploadPhotoAttachments({
    required List<File> attachmentsFile,
    required String id,
  }) async {
    try {
      List<String> fileNames =
          attachmentsFile.map((photo) => basename(photo.path)).toList();
      List<Reference> references = fileNames
          .map((fileName) => FirebaseStorage.instance.ref().child(fileName))
          .toList();
      List<String> urlPhotos = [];
      for (int i = 0; i < attachmentsFile.length; i++) {
        await references[i].putFile(attachmentsFile[i]);
        String downloadUrl = await references[i].getDownloadURL();
        urlPhotos.add(downloadUrl);
      }
      return Result.success(urlPhotos);
    } catch (e) {
      return const Result.failed('Failed to upload photo attachments');
    }
  }

  @override
  Future<Result<ReviewModel>> createReview(
    ReviewModel review,
    String id,
  ) async {
    CollectionReference<Map<String, dynamic>> discussions =
        _firebaseFirestore.collection('reviews');
    try {
      await discussions.doc(id).set({
        'reviews': FieldValue.arrayUnion([
          review.toJson(),
        ]),
      }, SetOptions(merge: true));
      var result = await discussions.doc(id).get();
      if (result.exists) {
        return Result.success(review);
      } else {
        return const Result.failed('Failed to create review data');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Failed to create review data');
    }
  }

  @override
  Future<Result<DetailCourseModel>> unlockCourse(
      {required DetailCourseModel detailCourse, Course? course}) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          _firebaseFirestore.doc('details/${detailCourse.id}');
      await documentReference.update({'isUnlock': detailCourse.isUnlock});

      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();

      if (result.exists) {
        DetailCourseModel updatedCourse =
            DetailCourseModel.fromJson(result.data()!);
        if (updatedCourse.isUnlock == detailCourse.isUnlock) {
          return Result.success(updatedCourse);
        } else {
          return const Result.failed('Failed to update user Data');
        }
      } else {
        return const Result.failed('Failed to update user Data');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Failed to update user Data');
    }
  }

  @override
  Future<Result<TeacherModel>> getTeacher({required String teacherId}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc('teachers/$teacherId');
    try {
      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();
      if (result.exists) {
        return Result.success(TeacherModel.fromJson(result.data()!));
      } else {
        return const Result.failed('Detail not found');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Detail not found');
    }
  }
}
