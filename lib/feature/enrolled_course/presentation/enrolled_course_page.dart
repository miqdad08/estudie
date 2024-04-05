import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/common_widget/item/course_item.dart';

import '../../../config/theme/app_theme.dart';
import '../../../injection_container.dart';
import 'bloc/enrolled_course_bloc.dart';

class EnrolledCoursePage extends StatelessWidget {
  const EnrolledCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Text(
              "Library",
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleLarge,
            ),
            verticalSpace(20),
            BlocProvider(
              create: (context) => EnrolledCourseBloc(sl())..add(GetEnrolledCourses()),
              child: BlocBuilder<EnrolledCourseBloc, EnrolledCourseState>(
                builder: (context, state) {
                  if (state is EnrolledCourseLoading) {
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is EnrolledCourseLoaded) {
                    return Column(
                      children: state.data
                          .map(
                            (data) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: CourseItem(
                                course: data.toCourseEntity(),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
