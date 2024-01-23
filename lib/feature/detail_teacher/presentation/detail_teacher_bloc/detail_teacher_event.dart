part of 'detail_teacher_bloc.dart';

abstract class DetailTeacherEvent extends Equatable {
  const DetailTeacherEvent();

  @override
  List<Object?> get props => [];
}

class GetCoursesByTeacher extends DetailTeacherEvent{
  final String idTeacher;

  const GetCoursesByTeacher({required this.idTeacher});

  @override
  List<Object?> get props => [idTeacher];
}