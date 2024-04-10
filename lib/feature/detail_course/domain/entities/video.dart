import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String id;
  final String name;
  final String videoUrl;
  final bool isDone;
  final String section;

  const Video({
    required this.id,
    required this.isDone,
    required this.name,
    required this.videoUrl,
    required this.section,
  });

  @override
  List<Object?> get props => [id, name, videoUrl, isDone, section];
}
