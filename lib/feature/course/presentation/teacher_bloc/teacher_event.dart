part of 'teacher_bloc.dart';

abstract class TeacherEvent extends Equatable{
  const TeacherEvent();

  @override
  List<Object?> get props => [];
}

class GetTeachers extends TeacherEvent{}
