part of 'detail_course_bloc.dart';

abstract class DetailCourseEvent extends Equatable {
  const DetailCourseEvent();

  @override
  List<Object> get props => [];
}

class GetDetailCourse extends DetailCourseEvent {
  final String id;

  const GetDetailCourse({required this.id});

  @override
  List<Object> get props => [id];
}

class CreateDiscussion extends DetailCourseEvent {
  final CreateDiscussionParam discussion;

  const CreateDiscussion({required this.discussion});

  @override
  List<Object> get props => [discussion];
}


class CreateReview extends DetailCourseEvent {
  final CreateReviewParam review;

  const CreateReview({required this.review});

  @override
  List<Object> get props => [review];
}