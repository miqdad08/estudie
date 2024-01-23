// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherModelImpl _$$TeacherModelImplFromJson(Map<String, dynamic> json) =>
    _$TeacherModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      specialist: json['specialist'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$TeacherModelImplToJson(_$TeacherModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'specialist': instance.specialist,
      'photoUrl': instance.photoUrl,
    };
