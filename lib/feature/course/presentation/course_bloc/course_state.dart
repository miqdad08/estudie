part of 'course_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CoursesSuccess extends CourseState {
  final List<Course> courses;

  const CoursesSuccess({required this.courses});

  @override
  List<Object> get props => [courses];
}

class CoursesFailed extends CourseState {
  final String message;

  const CoursesFailed({required this.message});

  @override
  List<Object> get props => [message];
}
