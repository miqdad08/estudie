// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrolled_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnrolledCourseModelImpl _$$EnrolledCourseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EnrolledCourseModelImpl(
      id: json['id'] as String,
      idCourse: json['idCourse'] as String,
      idTeacher: json['idTeacher'] as String,
      title: json['title'] as String,
      uid: json['uid'] as String,
      price: json['price'] as int? ?? 0,
      posterPath: json['posterPath'] as String?,
      category: json['category'] as String,
      total: json['total'] as int,
      rating: (json['rating'] as num?)?.toDouble(),
      lessons: (json['lessons'] as List<dynamic>)
          .map((e) => SectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EnrolledCourseModelImplToJson(
        _$EnrolledCourseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idCourse': instance.idCourse,
      'idTeacher': instance.idTeacher,
      'title': instance.title,
      'uid': instance.uid,
      'price': instance.price,
      'posterPath': instance.posterPath,
      'category': instance.category,
      'total': instance.total,
      'rating': instance.rating,
      'lessons': instance.lessons.map((e) => e.toJson()).toList(),
    };
