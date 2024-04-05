part of 'enrolled_course_bloc.dart';

abstract class EnrolledCourseState extends Equatable {
  const EnrolledCourseState();

  @override
  List<Object> get props => [];
}

class EnrolledCourseInitial extends EnrolledCourseState {}
class EnrolledCourseLoading extends EnrolledCourseState {}

class EnrolledCourseFailed extends EnrolledCourseState {
  final String message;

  const EnrolledCourseFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class EnrolledCourseLoaded extends EnrolledCourseState {
  final List<EnrolledCourseEntity> data;

  const EnrolledCourseLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

