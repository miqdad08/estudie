import '../../../../core/resources/result.dart';
import '../models/course/course.dart';

abstract class DetailTeacherDataSource {
  Future<Result<List<CourseModel>>> getCoursesByTeacher(String id);
}
