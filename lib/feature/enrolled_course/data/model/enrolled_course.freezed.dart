// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enrolled_course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EnrolledCourseModel _$EnrolledCourseModelFromJson(Map<String, dynamic> json) {
  return _EnrolledCourseModel.fromJson(json);
}

/// @nodoc
mixin _$EnrolledCourseModel {
  String get id => throw _privateConstructorUsedError;
  String get idCourse => throw _privateConstructorUsedError;
  String get idTeacher => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  String? get posterPath => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int? get progress => throw _privateConstructorUsedError;
  double? get rating =>
      throw _privateConstructorUsedError; // required List<SectionModel> lessons,
  List<VideoModel> get lessons => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnrolledCourseModelCopyWith<EnrolledCourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrolledCourseModelCopyWith<$Res> {
  factory $EnrolledCourseModelCopyWith(
          EnrolledCourseModel value, $Res Function(EnrolledCourseModel) then) =
      _$EnrolledCourseModelCopyWithImpl<$Res, EnrolledCourseModel>;
  @useResult
  $Res call(
      {String id,
      String idCourse,
      String idTeacher,
      String title,
      String uid,
      int? price,
      String? posterPath,
      String category,
      int total,
      int? progress,
      double? rating,
      List<VideoModel> lessons});
}

/// @nodoc
class _$EnrolledCourseModelCopyWithImpl<$Res, $Val extends EnrolledCourseModel>
    implements $EnrolledCourseModelCopyWith<$Res> {
  _$EnrolledCourseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idCourse = null,
    Object? idTeacher = null,
    Object? title = null,
    Object? uid = null,
    Object? price = freezed,
    Object? posterPath = freezed,
    Object? category = null,
    Object? total = null,
    Object? progress = freezed,
    Object? rating = freezed,
    Object? lessons = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idCourse: null == idCourse
          ? _value.idCourse
          : idCourse // ignore: cast_nullable_to_non_nullable
              as String,
      idTeacher: null == idTeacher
          ? _value.idTeacher
          : idTeacher // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      lessons: null == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<VideoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnrolledCourseModelImplCopyWith<$Res>
    implements $EnrolledCourseModelCopyWith<$Res> {
  factory _$$EnrolledCourseModelImplCopyWith(_$EnrolledCourseModelImpl value,
          $Res Function(_$EnrolledCourseModelImpl) then) =
      __$$EnrolledCourseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String idCourse,
      String idTeacher,
      String title,
      String uid,
      int? price,
      String? posterPath,
      String category,
      int total,
      int? progress,
      double? rating,
      List<VideoModel> lessons});
}

/// @nodoc
class __$$EnrolledCourseModelImplCopyWithImpl<$Res>
    extends _$EnrolledCourseModelCopyWithImpl<$Res, _$EnrolledCourseModelImpl>
    implements _$$EnrolledCourseModelImplCopyWith<$Res> {
  __$$EnrolledCourseModelImplCopyWithImpl(_$EnrolledCourseModelImpl _value,
      $Res Function(_$EnrolledCourseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idCourse = null,
    Object? idTeacher = null,
    Object? title = null,
    Object? uid = null,
    Object? price = freezed,
    Object? posterPath = freezed,
    Object? category = null,
    Object? total = null,
    Object? progress = freezed,
    Object? rating = freezed,
    Object? lessons = null,
  }) {
    return _then(_$EnrolledCourseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idCourse: null == idCourse
          ? _value.idCourse
          : idCourse // ignore: cast_nullable_to_non_nullable
              as String,
      idTeacher: null == idTeacher
          ? _value.idTeacher
          : idTeacher // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      lessons: null == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<VideoModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnrolledCourseModelImpl implements _EnrolledCourseModel {
  const _$EnrolledCourseModelImpl(
      {required this.id,
      required this.idCourse,
      required this.idTeacher,
      required this.title,
      required this.uid,
      this.price = 0,
      this.posterPath,
      required this.category,
      required this.total,
      this.progress = 0,
      this.rating,
      required final List<VideoModel> lessons})
      : _lessons = lessons;

  factory _$EnrolledCourseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrolledCourseModelImplFromJson(json);

  @override
  final String id;
  @override
  final String idCourse;
  @override
  final String idTeacher;
  @override
  final String title;
  @override
  final String uid;
  @override
  @JsonKey()
  final int? price;
  @override
  final String? posterPath;
  @override
  final String category;
  @override
  final int total;
  @override
  @JsonKey()
  final int? progress;
  @override
  final double? rating;
// required List<SectionModel> lessons,
  final List<VideoModel> _lessons;
// required List<SectionModel> lessons,
  @override
  List<VideoModel> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

  @override
  String toString() {
    return 'EnrolledCourseModel(id: $id, idCourse: $idCourse, idTeacher: $idTeacher, title: $title, uid: $uid, price: $price, posterPath: $posterPath, category: $category, total: $total, progress: $progress, rating: $rating, lessons: $lessons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrolledCourseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idCourse, idCourse) ||
                other.idCourse == idCourse) &&
            (identical(other.idTeacher, idTeacher) ||
                other.idTeacher == idTeacher) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      idCourse,
      idTeacher,
      title,
      uid,
      price,
      posterPath,
      category,
      total,
      progress,
      rating,
      const DeepCollectionEquality().hash(_lessons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrolledCourseModelImplCopyWith<_$EnrolledCourseModelImpl> get copyWith =>
      __$$EnrolledCourseModelImplCopyWithImpl<_$EnrolledCourseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnrolledCourseModelImplToJson(
      this,
    );
  }

  @override
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
}

abstract class _EnrolledCourseModel implements EnrolledCourseModel {
  const factory _EnrolledCourseModel(
      {required final String id,
      required final String idCourse,
      required final String idTeacher,
      required final String title,
      required final String uid,
      final int? price,
      final String? posterPath,
      required final String category,
      required final int total,
      final int? progress,
      final double? rating,
      required final List<VideoModel> lessons}) = _$EnrolledCourseModelImpl;

  factory _EnrolledCourseModel.fromJson(Map<String, dynamic> json) =
      _$EnrolledCourseModelImpl.fromJson;

  @override
  String get id;
  @override
  String get idCourse;
  @override
  String get idTeacher;
  @override
  String get title;
  @override
  String get uid;
  @override
  int? get price;
  @override
  String? get posterPath;
  @override
  String get category;
  @override
  int get total;
  @override
  int? get progress;
  @override
  double? get rating;
  @override // required List<SectionModel> lessons,
  List<VideoModel> get lessons;
  @override
  @JsonKey(ignore: true)
  _$$EnrolledCourseModelImplCopyWith<_$EnrolledCourseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
