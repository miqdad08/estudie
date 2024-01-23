import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:online_course_app/core/resources/result.dart';
import 'package:online_course_app/feature/course/data/models/course/course.dart';
import 'package:online_course_app/feature/course/data/models/teacher/teacher.dart';
import 'course_data_source.dart';

class FirebaseCourseService extends CourseDataSource {
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseCourseService({firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore =
            firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<List<CourseModel>>> getCourses() async {
    firestore.CollectionReference<Map<String, dynamic>> courses =
        _firebaseFirestore.collection('courses');
    try {
      var result = await courses.get();
      print('docs ${result.docs}');
      if (result.docs.isNotEmpty) {
        return Result.success(
            result.docs.map((e) => CourseModel.fromJson(e.data())).toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      print('error $e');
      return const Result.failed('Failed to get courses');
    }
  }

  @override
  Future<Result<List<TeacherModel>>> getTeachers() async{
    firestore.CollectionReference<Map<String, dynamic>> teachers =
    _firebaseFirestore.collection('teachers');
    try {
      var result = await teachers.get();
      if (result.docs.isNotEmpty) {
        return Result.success(
            result.docs.map((e) => TeacherModel.fromJson(e.data())).toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return const Result.failed('Failed to get teachers');
    }
  }
}
