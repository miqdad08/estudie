import '../../domain/entities/video.dart';

class VideoModel {
  final String id;
  final String name;
  final String videoUrl;
  final bool isDone;
  final String section;

  const VideoModel({
    required this.id,
    required this.isDone,
    required this.name,
    required this.videoUrl,
    required this.section,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'videoUrl': videoUrl,
      'isDone': isDone,
      'section': section,
    };
  }

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json["id"],
      name: json["name"],
      videoUrl: json["videoUrl"],
      isDone: json["isDone"],
      section: json["section"],
    );
  }

  factory VideoModel.fromEntity(Video video) {
    return VideoModel(
      id: video.id,
      isDone: video.isDone,
      name: video.name,
      videoUrl: video.videoUrl,
      section: video.section,
    );
  }

  Video toEntity() {
    return Video(
      id: id,
      isDone: isDone,
      name: name,
      videoUrl: videoUrl,
      section: section,
    );
  }
}
