
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'enrolled_course_detail_event.dart';
part 'enrolled_course_detail_state.dart';

class EnrolledCourseDetailBloc extends Bloc<EnrolledCourseDetailEvent, EnrolledCourseDetailState> {
  EnrolledCourseDetailBloc() : super(EnrolledCourseDetailInitial()) {
    on<EnrolledCourseDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
