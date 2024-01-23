import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/course.dart';
import '../../domain/usecases/get_courses.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCoursesUseCase _getCourses;

  CourseBloc(this._getCourses) : super(CourseInitial()) {
    on<GetCourses>(onGetCourses);
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
}
