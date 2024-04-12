part of 'enrolled_course_bloc.dart';

abstract class EnrolledCourseEvent extends Equatable {
  const EnrolledCourseEvent();

  @override
  List<Object?> get props => [];
}

class GetEnrolledCourses extends EnrolledCourseEvent {}
