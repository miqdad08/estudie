import 'package:online_course_app/feature/course/data/models/teacher/teacher.dart';
import 'package:online_course_app/feature/detail_course/data/model/discussion.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/detail_course.dart';
import 'package:online_course_app/feature/detail_course/data/model/review.dart';
import 'package:online_course_app/feature/detail_course/data/model/video.dart';

class DetailCourseModel {
  final String id;
  final String about;
  final int price;
  final VideoModel previewVideo;
  final TeacherModel? teacher;
  final List<ReviewModel> reviews;
  // final List<SectionModel> lessons;
  final List<VideoModel> lessons;
  final List<DiscussionModel>? discussions;
  final bool isUnlock;
  final String? userEnrolledCourse;

  const DetailCourseModel({
    required this.id,
    required this.about,
    required this.price,
    required this.previewVideo,
    this.teacher,
    required this.lessons,
    required this.reviews,
    required this.discussions,
    required this.isUnlock,
    this.userEnrolledCourse,
  });

  DetailCourseModel copyWith({
    String? id,
    String? about,
    int? price,
    VideoModel? previewVideo,
    TeacherModel? teacher,
    List<ReviewModel>? reviews,
    // List<SectionModel>? lessons,
    List<VideoModel>? lessons,
    final List<DiscussionModel>? discussions,
    String? userEnrolledCourse,
    bool? isUnlock,
  }) {
    return DetailCourseModel(
      id: id ?? this.id,
      about: about ?? this.about,
      price: price ?? this.price,
      previewVideo: previewVideo ?? this.previewVideo,
      teacher: teacher ?? this.teacher,
      reviews: reviews ?? this.reviews,
      lessons: lessons ?? this.lessons,
      discussions: discussions ?? this.discussions,
      isUnlock: isUnlock ?? this.isUnlock,
      userEnrolledCourse: userEnrolledCourse ?? this.userEnrolledCourse,
    );
  }

  factory DetailCourseModel.fromJson(Map<String, dynamic> json) {
    return DetailCourseModel(
      id: json['id'],
      about: json['about'],
      price: json['price'],
      previewVideo: VideoModel.fromJson(json["previewVideo"]),
      lessons: json["lessons"] == null
          ? []
          : List<VideoModel>.from(
              json['lessons'].map((item) => VideoModel.fromJson(item)),
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
      isUnlock: json['isUnlock'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'about': about,
      'price': price,
      'previewVideo': previewVideo.toJson(),
      // 'teacher': teacher.toJson(),
      'lessons': lessons.map((section) => section.toJson()).toList(),
      'reviews': reviews.map((review) => review.toJson()).toList(),
      'discussions':
          discussions?.map((discussion) => discussion.toJson()).toList(),
      'isUnlock': isUnlock,
    };
  }

  factory DetailCourseModel.fromEntity(DetailCourse detailCourse) {
    return DetailCourseModel(
      id: detailCourse.id,
      price: detailCourse.price!,
      about: detailCourse.about!,
      previewVideo: VideoModel.fromEntity(detailCourse.previewVideo),
      teacher: TeacherModel.fromEntity(detailCourse.teacher),
      lessons: List<VideoModel>.from(
        detailCourse.lessons.map((item) => VideoModel.fromEntity(item)),
      ),
      reviews: List<ReviewModel>.from(
        detailCourse.reviews.map((item) => ReviewModel.fromEntity(item)),
      ),
      discussions: detailCourse.discussions == null
          ? null
          : List<DiscussionModel>.from(
              detailCourse.discussions!
                  .map((item) => DiscussionModel.fromEntity(item)),
            ),
      isUnlock: detailCourse.isUnlock,
      userEnrolledCourse: detailCourse.userEnrolledCourse,
    );
  }

  DetailCourse toEntity() {
    return DetailCourse(
      id: id,
      about: about,
      price: price,
      previewVideo: previewVideo.toEntity(),
      teacher: teacher!.toEntity(),
      lessons: lessons.map((video) => video.toEntity()).toList(),
      reviews: reviews.map((review) => review.toEntity()).toList(),
      discussions:
          discussions?.map((discussion) => discussion.toEntity()).toList(),
      isUnlock: isUnlock,
      userEnrolledCourse: userEnrolledCourse,
    );
  }
}
