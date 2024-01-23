import 'package:equatable/equatable.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/video.dart';

class Section extends Equatable{
  final String sectionName;
  final List<Video> videos;

  const Section({
    required this.sectionName,
    required this.videos,
  });

  @override
  List<Object?> get props => [sectionName, videos];


}
