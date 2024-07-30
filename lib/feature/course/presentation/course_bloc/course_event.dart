part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable{
  const CourseEvent();
  @override
  List<Object> get props => [];
}


class GetCourses extends CourseEvent{}

class GetLastProgressCourse extends CourseEvent{
  final String idLastProgressCourse;

  const GetLastProgressCourse({required this.idLastProgressCourse});

  @override
  List<Object> get props => [idLastProgressCourse];
}