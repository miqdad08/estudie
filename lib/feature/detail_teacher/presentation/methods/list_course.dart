import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course_app/feature/detail_teacher/presentation/detail_teacher_bloc/detail_teacher_bloc.dart';
import 'package:online_course_app/injection_container.dart';
import '../../../../common_util/size/methods.dart';
import '../../../../common_widget/item/course_item.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../course/domain/entities/course.dart';
import '../../../course/domain/entities/teacher.dart';

Widget listCourse({
  required Teacher teacher,
  required final Function(Course data) onTap,
}) {
  return BlocProvider<DetailTeacherBloc>(
    create: (context) => DetailTeacherBloc(sl())..add(GetCoursesByTeacher(idTeacher: teacher.id)),
    child: BlocBuilder<DetailTeacherBloc, DetailTeacherState>(
      builder: (context, state) {
        if (state is CoursesSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Courses",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              verticalSpace(8),
              Column(
                children: state.courses
                    .map(
                      (data) => GestureDetector(
                        onTap: () => onTap(data),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
                          child: CourseItem(
                            course: data,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          );
        }
        if (state is CourseLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    ),
  );
}
