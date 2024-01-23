part of 'detail_teacher_bloc.dart';

abstract class DetailTeacherState extends Equatable {
  const DetailTeacherState();

  @override
  List<Object?> get props => [];
}

class CourseInitial extends DetailTeacherState {}

class CourseLoading extends DetailTeacherState {}

class CoursesSuccess extends DetailTeacherState {
  final List<Course> courses;

  const CoursesSuccess({required this.courses});

  @override
  List<Object> get props => [courses];
}

class CoursesFailed extends DetailTeacherState {
  final String message;

  const CoursesFailed({required this.message});

  @override
  List<Object> get props => [message];
}
