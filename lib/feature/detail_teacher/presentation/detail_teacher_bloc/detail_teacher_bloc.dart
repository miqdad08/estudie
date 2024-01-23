import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_course_app/feature/detail_teacher/domain/usecases/get_courses.dart';

import '../../../course/domain/entities/course.dart';


part 'detail_teacher_event.dart';

part 'detail_teacher_state.dart';

class DetailTeacherBloc extends Bloc<DetailTeacherEvent, DetailTeacherState> {
  final GetCoursesByTeacherUseCase _getCourses;

  DetailTeacherBloc(this._getCourses) : super(CourseInitial()) {
    on<GetCoursesByTeacher>(onGetCourses);
  }

  void onGetCourses(
      GetCoursesByTeacher event, Emitter<DetailTeacherState> emit) async {
    emit(CourseLoading());
    final courses = await _getCourses(params: event.idTeacher);
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
