import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';
import 'package:online_course_app/feature/enrolled_course/domain/usecases/set_is_video_done.dart';
import 'package:online_course_app/feature/enrolled_course/domain/usecases/set_video_is_done/set_video_is_done_param.dart';


part 'enrolled_course_detail_event.dart';

part 'enrolled_course_detail_state.dart';

class EnrolledCourseDetailBloc
    extends Bloc<EnrolledCourseDetailEvent, EnrolledCourseDetailState> {
  final SetVideoIsDoneUseCase _setVideoIsDoneUseCase;

  EnrolledCourseDetailBloc(this._setVideoIsDoneUseCase)
      : super(EnrolledCourseDetailInitial()) {
    on<NextVideo>(onNextVideo);
  }

  void onNextVideo(
      NextVideo event, Emitter<EnrolledCourseDetailState> emit) async {
    emit(EnrolledCourseDetailLoading());
    final courses = await _setVideoIsDoneUseCase(params: event.param);
    courses.fold(
      (failure) => emit(
        EnrolledCourseDetailFailed(message: failure.message),
      ),
      (data) => emit(
        EnrolledCourseDetailLoaded(course: data),
      ),
    );
  }
}
