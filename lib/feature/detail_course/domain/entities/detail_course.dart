import 'package:equatable/equatable.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/discussion.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/review.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/video.dart';

import '../../../course/domain/entities/teacher.dart';

class DetailCourse extends Equatable {
  final String id;
  final String? about;
  final int? price;
  final Video previewVideo;
  final Teacher teacher;
  // final List<Section> lessons;
  final List<Video> lessons;
  final List<Review> reviews;
  final List<Discussion>? discussions;
  final bool isUnlock;
  final String? userEnrolledCourse;

  const DetailCourse({
    this.about,
    required this.id,
    this.price,
    required this.teacher,
    required this.previewVideo,
    required this.lessons,
    required this.reviews,
    this.discussions,
    this.isUnlock = false,
    this.userEnrolledCourse,
  });

  DetailCourse copyWith({
    String? id,
    String? about,
    int? price,
    Video? previewVideo,
    Teacher? teacher,
    List<Video>? lessons,
    // List<Section>? lessons,
    List<Review>? reviews,
    List<Discussion>? discussions,
    bool? isUnlock,
    String? userEnrolledCourse,
  }) {
    return DetailCourse(
      id: id ?? this.id,
      about: about ?? this.about,
      price: price ?? this.price,
      previewVideo: previewVideo ?? this.previewVideo,
      teacher: teacher ?? this.teacher,
      lessons: lessons ?? this.lessons,
      reviews: reviews ?? this.reviews,
      discussions: discussions ?? this.discussions,
      isUnlock: isUnlock ?? this.isUnlock,
      userEnrolledCourse: userEnrolledCourse ?? this.userEnrolledCourse,
    );
  }

  @override
  List<Object?> get props => [
    id,
    about,
    price,
    previewVideo,
    lessons,
    reviews,
    discussions,
    isUnlock,
    userEnrolledCourse,
  ];


}
