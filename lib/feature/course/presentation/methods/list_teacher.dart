import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course_app/common_widget/item/teacher_item.dart';
import 'package:online_course_app/feature/course/presentation/teacher_bloc/teacher_bloc.dart';
import '../../../../common_util/size/methods.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/teacher.dart';

Widget listTeacher({
  required final Function(Teacher teacher) onTap,
}) {
  return BlocProvider<TeacherBloc>(
    create: (context) => TeacherBloc(sl())..add(GetTeachers()),
    child: BlocBuilder<TeacherBloc, TeacherState>(
      builder: (context, state) {
        if (state is TeacherSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Popular Teachers",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              verticalSpace(8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.teachers
                      .map(
                        (data) => GestureDetector(
                          onTap: () => onTap(data),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: data == state.teachers.first ? 24 : 18,
                              right: data == state.teachers.last ? 24 : 0,
                            ),
                            child: TeacherItem(
                              teacher: data,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          );
        }
        if (state is TeacherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    ),
  );
}
