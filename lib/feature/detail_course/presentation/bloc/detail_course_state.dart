part of 'detail_course_bloc.dart';

abstract class DetailCourseState extends Equatable {
  const DetailCourseState();

  @override
  List<Object> get props => [];
}

class DetailCourseLoading extends DetailCourseState {}
class UnlockCourseLoading extends DetailCourseState {}

class DetailCourseLoaded extends DetailCourseState {
  final DetailCourse data;

  const DetailCourseLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class DetailCourseFailed extends DetailCourseState {
  final String message;

  const DetailCourseFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class CreateDiscussionFailed extends DetailCourseState {
  final String message;

  const CreateDiscussionFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class CreateDiscussionSuccess extends DetailCourseState {
  final String message;

  const CreateDiscussionSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class ListDiscussionsLoaded extends DetailCourseState {
  final List<Discussion> data;

  const ListDiscussionsLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class CreateReviewFailed extends DetailCourseState {
  final String message;

  const CreateReviewFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class CreateReviewSuccess extends DetailCourseState {
  final String message;

  const CreateReviewSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class UnlockCourseSuccess extends DetailCourseState {
  final String message;

  const UnlockCourseSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class UnlockCourseFailed extends DetailCourseState {
  final String message;

  const UnlockCourseFailed({required this.message});

  @override
  List<Object> get props => [message];
}
class UserEnrolledCourseLoaded extends DetailCourseState {
  final EnrolledCourseEntity data;
  final Video video;

  const UserEnrolledCourseLoaded({required this.data, required this.video});

  @override
  List<Object> get props => [data];
}