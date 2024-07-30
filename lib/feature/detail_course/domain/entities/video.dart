import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String id;
  final String name;
  final String videoUrl;
  bool isDone;
  final String section;

  Video({
    required this.id,
    this.isDone = false,
    required this.name,
    required this.videoUrl,
    required this.section,
  });

  @override
  List<Object?> get props => [id, name, videoUrl, isDone, section];

  Video copyWith({
    String? id,
    bool? isDone,
    String? name,
    String? videoUrl,
    String? section,
  }) {
    return Video(
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      name: name ?? this.name,
      videoUrl: videoUrl ?? this.videoUrl,
      section: section ?? this.section,
    );
  }
}
