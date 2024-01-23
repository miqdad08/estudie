import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course_app/injection_container.dart';
import '../../../../common_util/size/methods.dart';
import '../../../../common_widget/item/upcoming_course_item.dart';
import '../../../../config/theme/app_theme.dart';
import '../../domain/entities/course.dart';
import '../course_bloc/course_bloc.dart';

Widget listCourse({
  required final Function(Course title) onTap,
}) {
  return BlocProvider<CourseBloc>(
    create: (context) => CourseBloc(sl())..add(GetCourses()),
    child: BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        if (state is CoursesSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "New Upcoming",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              verticalSpace(8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.courses
                      .map(
                        (data) => GestureDetector(
                          onTap: () => onTap(data),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: data == state.courses.first ? 24 : 18,
                              right: data == state.courses.last ? 24 : 0,
                            ),
                            child: UpcomingCourseItem(
                              course: data,
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
