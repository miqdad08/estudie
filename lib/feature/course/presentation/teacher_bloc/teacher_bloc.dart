import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/teacher.dart';
import '../../domain/usecases/get_teachers.dart';

part 'teacher_event.dart';

part 'teacher_state.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  final GetTeachersUseCase _getTeachers;

  TeacherBloc(this._getTeachers) : super(TeacherInitial()) {
    on<GetTeachers>(onGetTeachers);
  }

  void onGetTeachers(GetTeachers event, Emitter<TeacherState> emit) async {
    emit(TeacherLoading());
    final teachers = await _getTeachers();
    teachers.fold(
      (failure) => emit(
        TeacherFailed(message: failure.message),
      ),
      (data) => emit(
        TeacherSuccess(teachers: data),
      ),
    );
  }
}
