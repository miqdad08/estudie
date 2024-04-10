part of 'enrolled_course_detail_bloc.dart';

abstract class EnrolledCourseDetailState extends Equatable {
  const EnrolledCourseDetailState();

  @override
  List<Object> get props => [];
}

class EnrolledCourseDetailInitial extends EnrolledCourseDetailState {}

class EnrolledCourseDetailLoading extends EnrolledCourseDetailState {}

class EnrolledCourseDetailFailed extends EnrolledCourseDetailState {}
