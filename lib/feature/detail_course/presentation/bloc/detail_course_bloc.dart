import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/detail_course.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/discussion.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/create_discussion/create_discussion.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/create_discussion/create_discussion_param.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/create_review/create_review.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/get_detail_course.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/get_discussions.dart';
import 'package:online_course_app/feature/detail_course/domain/usecases/unlock_course.dart';
import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';

import '../../../course/domain/entities/course.dart';
import '../../../enrolled_course/domain/usecases/get_last_progress_course.dart';
import '../../domain/entities/video.dart';
import '../../domain/usecases/create_review/create_review_param.dart';

part 'detail_course_event.dart';

part 'detail_course_state.dart';

class DetailCourseBloc extends Bloc<DetailCourseEvent, DetailCourseState> {
  final GetDetailCourseUseCase _getDetailCourse;
  final CreateDiscussionUseCase _createDiscussion;
  final CreateReviewUseCase _createReview;
  final UnlockCourseUseCase _unlockCourse;
  final GetDiscussionsUseCase _getDiscussions;
  final GetLastProgressCourseUseCase _getLastProgressCourse;

  DetailCourseBloc(
      this._getDetailCourse,
      this._createDiscussion,
      this._createReview,
      this._unlockCourse,
      this._getDiscussions,
      this._getLastProgressCourse)
      : super(DetailCourseLoading()) {
    on<GetDetailCourse>(onGetDetailCourse);
    on<CreateDiscussion>(onCreateDiscussion);
    on<CreateReview>(onCreateReview);
    on<UnlockCourse>(onUnlockCourse);
    on<GetDiscussions>(onGetDiscussions);
    on<GetUserEnrolledCourse>(onGetUserEnrolledCourse);
  }

  void onGetDetailCourse(
      GetDetailCourse event, Emitter<DetailCourseState> emit) async {
    emit(DetailCourseLoading());
    final detailCourse = await _getDetailCourse(
      params: event.course,
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
      (failure) => emit(CreateReviewFailed(message: failure.message)),
      (data) {
        emit(
          const CreateReviewSuccess(
            message: 'Success to create a new discussion',
          ),
        );
      },
    );
  }

  void onUnlockCourse(
      UnlockCourse event, Emitter<DetailCourseState> emit) async {
    emit(UnlockCourseLoading());
    final unlockCourse = await _unlockCourse(
      params: UnlockCourseParam(
          detailCourse: event.detailCourse, course: event.course),
    );
    unlockCourse.fold(
      (failure) => emit(UnlockCourseFailed(message: failure.message)),
      (data) {
        emit(
          const UnlockCourseSuccess(
            message: 'Success to enroll this course',
          ),
        );
      },
    );
  }

  void onGetDiscussions(
      GetDiscussions event, Emitter<DetailCourseState> emit) async {
    emit(DetailCourseLoading());
    final resultDiscussion = await _getDiscussions(params: event.idCourse);
    resultDiscussion.fold(
      (failure) => emit(DetailCourseFailed(message: failure.message)),
      (data) {
        emit(
          ListDiscussionsLoaded(
            data: data,
          ),
        );
      },
    );
  }

  void onGetUserEnrolledCourse(
      GetUserEnrolledCourse event, Emitter<DetailCourseState> emit) async {
    emit(DetailCourseLoading());
    final resultEnrolledCourse = await _getLastProgressCourse(params: event.idCourse);
    resultEnrolledCourse.fold(
      (failure) => emit(DetailCourseFailed(message: failure.message)),
      (data) {
        emit(
          UserEnrolledCourseLoaded(
            data: data, video: event.video,
          ),
        );
      },
    );
  }
}
