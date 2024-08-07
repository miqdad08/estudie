import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/teacher.dart';

part 'teacher.g.dart';

part 'teacher.freezed.dart';

@freezed
class TeacherModel with _$TeacherModel {
  const factory TeacherModel({
    required String id,
    required String name,
    required String email,
    required String specialist,
    required String? photoUrl,
  }) = _TeacherModel;

  factory TeacherModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherModelFromJson(json);

  factory TeacherModel.fromEntity(Teacher teacher) {
    return TeacherModel(
      id: teacher.id,
      name: teacher.id,
      email: teacher.email,
      specialist: teacher.specialist,
      photoUrl: teacher.photoUrl,
    );
  }

  Teacher toEntity() {
    return Teacher(
      id: id,
      name: name,
      email: email,
      specialist: specialist,
      photoUrl: photoUrl,
    );
  }
}
