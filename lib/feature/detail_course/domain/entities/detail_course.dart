import 'package:equatable/equatable.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/discussion.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/review.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/section.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/video.dart';

class DetailCourse extends Equatable {
  final String id;
  final String? about;
  final Video previewVideo;
  final List<Section> lessons;
  final List<Review> reviews;
  final List<Discussion>? discussions;

  const DetailCourse({
    this.about,
    required this.id,
    required this.previewVideo,
    required this.lessons,
    required this.reviews,
    this.discussions,
  });

  @override
  List<Object?> get props => [
        id,
        about,
        previewVideo,
        lessons,
        reviews,
        discussions,
      ];
}
