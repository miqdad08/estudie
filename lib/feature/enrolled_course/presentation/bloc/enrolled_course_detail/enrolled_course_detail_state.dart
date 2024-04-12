part of 'enrolled_course_detail_bloc.dart';

abstract class EnrolledCourseDetailState extends Equatable {
  const EnrolledCourseDetailState();

  @override
  List<Object> get props => [];
}

class EnrolledCourseDetailInitial extends EnrolledCourseDetailState {}

class EnrolledCourseDetailLoading extends EnrolledCourseDetailState {}

class EnrolledCourseDetailLoaded extends EnrolledCourseDetailState {
  final EnrolledCourseEntity course;

  const EnrolledCourseDetailLoaded({required this.course});

  @override
  List<Object> get props => [course];
}

class EnrolledCourseDetailFailed extends EnrolledCourseDetailState {
  final String message;

  const EnrolledCourseDetailFailed({required this.message});

  @override
  List<Object> get props => [message];
}
