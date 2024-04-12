import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_course_app/feature/detail_course/data/model/video.dart';
import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';


part 'enrolled_course.g.dart';

part 'enrolled_course.freezed.dart';

@freezed
class EnrolledCourseModel with _$EnrolledCourseModel {
  const factory EnrolledCourseModel({
    required String id,
    required String idCourse,
    required String idTeacher,
    required String title,
    required String uid,
    @Default(0) int? price,
    String? posterPath,
    required String category,
    required int total,
    @Default(0) int? progress,
    double? rating,
    // required List<SectionModel> lessons,
    required List<VideoModel> lessons,
  }) = _EnrolledCourseModel;

  factory EnrolledCourseModel.fromJson(Map<String, dynamic> json) =>
      _$EnrolledCourseModelFromJson(json);

  EnrolledCourseEntity toEntity() {
    return EnrolledCourseEntity(
      id: id,
      idCourse: idCourse,
      idTeacher: idTeacher,
      title: title,
      uid: uid,
      category: category,
      total: total,
      progress: progress,
      rating: rating,
      posterPath: posterPath,
      price: price,
      lessons: lessons.map((lesson) => lesson.toEntity()).toList(),
    );
  }

  factory EnrolledCourseModel.fromEntity(EnrolledCourseEntity enrolledCourse) {
    return EnrolledCourseModel(
      id: enrolledCourse.id,
      idCourse: enrolledCourse.idCourse,
      idTeacher: enrolledCourse.idTeacher,
      title: enrolledCourse.title,
      uid: enrolledCourse.uid,
      category: enrolledCourse.category,
      total: enrolledCourse.total,
      rating: enrolledCourse.rating,
      posterPath: enrolledCourse.posterPath,
      price: enrolledCourse.price,
      progress: enrolledCourse.progress,
      lessons: List<VideoModel>.from(enrolledCourse.lessons.map((lesson) => VideoModel.fromEntity(lesson))),
    );
  }
}
