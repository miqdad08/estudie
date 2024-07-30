import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';
import 'package:online_course_app/feature/enrolled_course/domain/usecases/get_last_progress_course.dart';

import '../../domain/entities/course.dart';
import '../../domain/usecases/get_courses.dart';

part 'course_event.dart';

part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCoursesUseCase _getCourses;
  final GetLastProgressCourseUseCase _getLastProgressCourse;

  CourseBloc(this._getCourses, this._getLastProgressCourse)
      : super(CourseInitial()) {
    on<GetCourses>(onGetCourses);
    on<GetLastProgressCourse>(onGetLastProgressCourses);
  }

  void onGetCourses(GetCourses event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    final courses = await _getCourses();
    courses.fold(
      (failure) => emit(
        CoursesFailed(message: failure.message),
      ),
      (data) => emit(
        CoursesSuccess(courses: data),
      ),
    );
  }

  void onGetLastProgressCourses(
      GetLastProgressCourse event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    final courses =
        await _getLastProgressCourse(params: event.idLastProgressCourse);
    courses.fold(
      (failure) => emit(
        CoursesFailed(message: failure.message),
      ),
      (data) => emit(
        LastProgressCourseLoaded(data: data),
      ),
    );
  }
}
