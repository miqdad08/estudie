import 'package:online_course_app/feature/detail_course/data/model/video.dart';

import '../../domain/entities/section.dart';

class SectionModel {
  final String sectionName;
  final List<VideoModel> videos;

  const SectionModel({
    required this.sectionName,
    required this.videos,
  });

  Map<String, dynamic> toJson() {
    return {
      'sectionName': sectionName,
      'videos': videos.map((video) => video.toJson()).toList(),
    };
  }

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      sectionName: json['sectionName'],
      videos: json["videos"] == null
          ? []
          : List<VideoModel>.from(
        json["videos"].map((x) => VideoModel.fromJson(x)),
      ),
    );
  }

  factory SectionModel.fromEntity(Section section) {
    return SectionModel(
      sectionName: section.sectionName,
      videos: List<VideoModel>.from(
        section.videos.map((x) => VideoModel.fromEntity(x)),
      ),
    );
  }

  Section toEntity() {
    return Section(
      sectionName: sectionName,
      videos: videos.map((video) => video.toEntity()).toList(),
    );
  }
}
