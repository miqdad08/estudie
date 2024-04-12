part of 'enrolled_course_detail_bloc.dart';

abstract class EnrolledCourseDetailEvent extends Equatable {
  const EnrolledCourseDetailEvent();

  @override
  List<Object?> get props => [];
}

class NextVideo extends EnrolledCourseDetailEvent {
  final SetVideoIsDoneParam param;

  const NextVideo({required this.param});

  @override
  List<Object?> get props => [param];
}



