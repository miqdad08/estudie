import '../../domain/entities/video.dart';

class VideoModel {
  final String name;
  final String videoUrl;
  final bool isDone;

  const VideoModel({
    required this.isDone,
    required this.name,
    required this.videoUrl,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      name: json["name"],
      videoUrl: json["videoUrl"],
      isDone: json["isDone"],
    );
  }

  Video toEntity() {
    return Video(
      isDone: isDone,
      name: name,
      videoUrl: videoUrl,
    );
  }
}
