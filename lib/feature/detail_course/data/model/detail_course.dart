import 'package:online_course_app/feature/detail_course/data/model/discussion.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/detail_course.dart';
import 'package:online_course_app/feature/detail_course/data/model/review.dart';
import 'package:online_course_app/feature/detail_course/data/model/section.dart';
import 'package:online_course_app/feature/detail_course/data/model/video.dart';

class DetailCourseModel {
  final String id;
  final String about;
  final VideoModel previewVideo;
  final List<ReviewModel> reviews;
  final List<SectionModel> lessons;
  final List<DiscussionModel>? discussions;

  const DetailCourseModel({
    required this.id,
    required this.about,
    required this.previewVideo,
    required this.lessons,
    required this.reviews,
    required this.discussions,
  });

  DetailCourseModel copyWith({
    String? id,
    String? about,
    VideoModel? previewVideo,
    List<ReviewModel>? reviews,
    List<SectionModel>? lessons,
    final List<DiscussionModel>? discussions,
  }) {
    return DetailCourseModel(
      id: id ?? this.id,
      about: about ?? this.about,
      previewVideo: previewVideo ?? this.previewVideo,
      reviews: reviews ?? this.reviews,
      lessons: lessons ?? this.lessons,
      discussions: discussions ?? this.discussions,
    );
  }

  factory DetailCourseModel.fromJson(Map<String, dynamic> json) {
    return DetailCourseModel(
      id: json['id'],
      about: json['about'],
      previewVideo: VideoModel.fromJson(json["previewVideo"]),
      lessons: json["lessons"] == null
          ? []
          : List<SectionModel>.from(
              json['lessons'].map((item) => SectionModel.fromJson(item)),
            ),
      reviews: json["reviews"] == null
          ? []
          : List<ReviewModel>.from(
              json["reviews"]!.map((item) => ReviewModel.fromJson(item)),
            ),
      discussions: json['discussions'] == null
          ? []
          : List<DiscussionModel>.from(
              json["discussions"]!
                  .map((item) => DiscussionModel.fromJson(item)),
            ),
    );
  }

  DetailCourse toEntity() {
    return DetailCourse(
      id: id,
      about: about,
      previewVideo: previewVideo.toEntity(),
      lessons: lessons.map((section) => section.toEntity()).toList(),
      reviews: reviews.map((review) => review.toEntity()).toList(),
      discussions: discussions?.map((discussion) => discussion.toEntity()).toList(),
    );
  }
}
