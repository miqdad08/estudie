part of 'teacher_bloc.dart';

abstract class TeacherState extends Equatable{
  const TeacherState();

  @override
  List<Object?> get props => [];
}

class TeacherInitial extends TeacherState {}

class TeacherLoading extends TeacherState {}

class TeacherSuccess extends TeacherState {
  final List<Teacher> teachers;

  const TeacherSuccess({required this.teachers});

  @override
  List<Object> get props => [teachers];
}

class TeacherFailed extends TeacherState {
  final String message;

  const TeacherFailed({required this.message});

  @override
  List<Object> get props => [message];
}

