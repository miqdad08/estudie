// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseModelImpl _$$CourseModelImplFromJson(Map<String, dynamic> json) =>
    _$CourseModelImpl(
      id: json['id'] as String,
      idTeacher: json['idTeacher'] as String,
      title: json['title'] as String,
      price: json['price'] as int? ?? 0,
      posterPath: json['posterPath'] as String?,
      category: json['category'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$CourseModelImplToJson(_$CourseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idTeacher': instance.idTeacher,
      'title': instance.title,
      'price': instance.price,
      'posterPath': instance.posterPath,
      'category': instance.category,
      'rating': instance.rating,
    };
