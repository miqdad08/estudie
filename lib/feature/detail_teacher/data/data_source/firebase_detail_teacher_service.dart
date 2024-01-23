import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:online_course_app/core/resources/result.dart';
import '../models/course/course.dart';
import 'detail_teacher_data_source.dart';

class FirebaseDetailTeacherService extends DetailTeacherDataSource {
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseDetailTeacherService({firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore =
            firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<List<CourseModel>>> getCoursesByTeacher(String id) async {
    firestore.CollectionReference<Map<String, dynamic>> courses =
        _firebaseFirestore.collection('courses');
    try {
      var result = await courses.where('idTeacher', isEqualTo: id).get();
      if (result.docs.isNotEmpty) {
        return Result.success(
            result.docs.map((e) => CourseModel.fromJson(e.data())).toList());
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return const Result.failed('Failed to get courses');
    }
  }
}
