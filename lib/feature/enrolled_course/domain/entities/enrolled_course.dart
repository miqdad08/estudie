import 'package:equatable/equatable.dart';

import '../../../course/domain/entities/course.dart';

class EnrolledCourseEntity extends Equatable {
  final String id;
  final String idCourse;
  final String idTeacher;
  final String title;
  final String uid;
  final int? price;
  final String? posterPath;
  final String category;
  final double? rating;
  final int total;

  const EnrolledCourseEntity({
    required this.idCourse,
    required this.id,
    required this.idTeacher,
    required this.title,
    required this.uid,
    required this.price,
    required this.posterPath,
    required this.category,
    required this.rating,
    required this.total,
  });

  EnrolledCourseEntity copyWith({
    String? id,
    String? idCourse,
    String? idTeacher,
    String? title,
    String? uid,
    int? price,
    String? posterPath,
    String? category,
    double? rating,
    int? total,
  }) {
    return EnrolledCourseEntity(
      id: id ?? this.id,
      idCourse: idCourse ?? this.idCourse,
      idTeacher: idTeacher ?? this.idTeacher,
      title: title ?? this.title,
      uid: uid ?? this.uid,
      price: price ?? this.price,
      posterPath: posterPath ?? this.posterPath,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      total: total ?? this.total,
    );
  }

  factory EnrolledCourseEntity.fromCourse(Course enrolledCourse) {
    return EnrolledCourseEntity(
      id: enrolledCourse.id,
      idCourse: enrolledCourse.id,
      idTeacher: enrolledCourse.idTeacher,
      title: enrolledCourse.title,
      uid: 'ui',
      category: enrolledCourse.category,
      total: 0,
      rating: enrolledCourse.rating,
      posterPath: enrolledCourse.posterPath,
      price: enrolledCourse.price,
    );
  }

  Course toCourseEntity() {
    return Course(
      id: idCourse,
      idTeacher: idTeacher,
      title: title,
      price: price,
      posterPath: posterPath,
      category: category,
      rating: rating ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        idCourse,
        idTeacher,
        title,
        uid,
        price,
        posterPath,
        category,
        rating
      ];
}
