import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_course_app/common_util/extensions/data_value.dart';
import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';
import 'package:online_course_app/feature/enrolled_course/domain/usecases/set_is_video_done.dart';
import 'package:online_course_app/feature/enrolled_course/domain/usecases/set_video_is_done/set_video_is_done_param.dart';

import '../../../../auth/domain/usecases/set_id_last_progress_course/set_id_last_progress_course.dart';
import '../../../../auth/domain/usecases/set_id_last_progress_course/set_id_last_progress_course_param.dart';

part 'enrolled_course_detail_event.dart';

part 'enrolled_course_detail_state.dart';

class EnrolledCourseDetailBloc
    extends Bloc<EnrolledCourseDetailEvent, EnrolledCourseDetailState> {
  final SetVideoIsDoneUseCase _setVideoIsDoneUseCase;
  final SetIdLastProgressCourseUseCase _setIdLastProgressCourseUseCase;

  EnrolledCourseDetailBloc(
      this._setVideoIsDoneUseCase, this._setIdLastProgressCourseUseCase)
      : super(EnrolledCourseDetailInitial()) {
    on<NextVideo>(onNextVideo);
  }

  void onNextVideo(
      NextVideo event, Emitter<EnrolledCourseDetailState> emit) async {
    emit(EnrolledCourseDetailLoading());
    final courses = await _setVideoIsDoneUseCase(params: event.param);
    if (courses.isRight()) {
      final resultSetIdLastProgressCourse =
          await _setIdLastProgressCourseUseCase(
              params: SetIdLastProgressCourseParam(
                  idLastProgressCourse: event.param.course.id));
      resultSetIdLastProgressCourse.fold(
        (failure) => emit(EnrolledCourseDetailFailed(message: failure.message)),
        (data) => emit(
          EnrolledCourseDetailLoaded(course: courses.asRight()),
        ),
      );
    } else {
      emit(EnrolledCourseDetailFailed(message: courses.asLeft().message));
    }
  }
}
