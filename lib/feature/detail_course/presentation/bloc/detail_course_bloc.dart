import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/detail_course.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/create_discussion/create_discussion.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/create_discussion/create_discussion_param.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/create_review/create_review.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/get_detail_course.dart';

import '../../domain/usecases/create_review/create_review_param.dart';

part 'detail_course_event.dart';

part 'detail_course_state.dart';

class DetailCourseBloc extends Bloc<DetailCourseEvent, DetailCourseState> {
  final GetDetailCourseUseCase _getDetailCourse;
  final CreateDiscussionUseCase _createDiscussion;
  final CreateReviewUseCase  _createReview;

  DetailCourseBloc(this._getDetailCourse, this._createDiscussion, this._createReview)
      : super(DetailCourseLoading()) {
    on<GetDetailCourse>(onGetDetailCourse);
    on<CreateDiscussion>(onCreateDiscussion);
    on<CreateReview>(onCreateReview);
  }

  void onGetDetailCourse(
      GetDetailCourse event, Emitter<DetailCourseState> emit) async {
    emit(DetailCourseLoading());
    final detailCourse = await _getDetailCourse(
      params: event.id,
    );
    detailCourse.fold(
      (failure) => emit(DetailCourseFailed(message: failure.message)),
      (data) => emit(DetailCourseLoaded(data: data)),
    );
  }

  void onCreateDiscussion(
      CreateDiscussion event, Emitter<DetailCourseState> emit) async {
    emit(DetailCourseLoading());
    final createDiscussion = await _createDiscussion(
      params: event.discussion,
    );
    createDiscussion.fold(
      (failure) => emit(CreateDiscussionFailed(message: failure.message)),
      (data) {
        emit(
          const CreateDiscussionSuccess(
            message: 'Success to create a new discussion',
          ),
        );
      },
    );
  }

  void onCreateReview(
      CreateReview event, Emitter<DetailCourseState> emit) async {
    emit(DetailCourseLoading());
    final createReview = await _createReview(
      params: event.review,
    );
    createReview.fold(
          (failure) => emit(CreateReviewSuccess(message: failure.message)),
          (data) {
        emit(
          const CreateReviewSuccess(
            message: 'Success to create a new discussion',
          ),
        );
      },
    );
  }
}