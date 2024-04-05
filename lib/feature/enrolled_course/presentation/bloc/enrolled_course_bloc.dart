
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';

import '../../domain/usecases/get_enrolled_course.dart';

part 'enrolled_course_event.dart';

part 'enrolled_course_state.dart';

class EnrolledCourseBloc
    extends Bloc<EnrolledCourseEvent, EnrolledCourseState> {

  final GetEnrolledCoursesUseCase _getEnrolledCourse;

  EnrolledCourseBloc(this._getEnrolledCourse) : super(EnrolledCourseInitial()) {
    on<EnrolledCourseEvent>(onGetEnrolledCourse);
  }

  void onGetEnrolledCourse(
      EnrolledCourseEvent event, Emitter<EnrolledCourseState> emit) async {
    emit(EnrolledCourseLoading());
    final courses = await _getEnrolledCourse();
    courses.fold(
      (failure) => emit(
        EnrolledCourseFailed(message: failure.message),
      ),
      (data) => emit(
        EnrolledCourseLoaded(data: data),
      ),
    );
  }
}
