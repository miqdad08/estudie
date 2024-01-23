import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/course.dart';

part 'course.g.dart';

part 'course.freezed.dart';

@freezed
class CourseModel with _$CourseModel {
  const factory CourseModel({
    required String id,
    required String idTeacher,
    required String title,
    @Default(0) int? price,
    String? posterPath,
    required String category,
    required double rating,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);

  Course toEntity() {
    return Course(
      id: id,
      idTeacher: idTeacher,
      title: title,
      category: category,
      rating: rating,
      price: price,
      posterPath: posterPath,
    );
  }
}
