import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String name;
  final String videoUrl;
  final bool isDone;

  const Video({
    required this.isDone,
    required this.name,
    required this.videoUrl,
  });

  @override
  List<Object?> get props => [name, videoUrl, isDone];
}
