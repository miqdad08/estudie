import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';
import 'package:online_course_app/common_widget/item/last_progress_item.dart';
import 'package:online_course_app/feature/course/presentation/course_bloc/course_bloc.dart';

import '../../../../common_util/size/methods.dart';
import '../../../../config/constant/image_constant.dart';
import '../../../../config/theme/app_decoration.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../../injection_container.dart';
import '../../../enrolled_course/presentation/bloc/enrolled_course/enrolled_course_bloc.dart';
import '../../../enrolled_course/presentation/detail_enrolled_course_page.dart';

Widget lastProgress(BuildContext context,
    {required String idLastProgressCourse}) {
  return BlocProvider(
    create: (context) => CourseBloc(sl(), sl())
      ..add(GetLastProgressCourse(idLastProgressCourse: idLastProgressCourse)),
    child: BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(state is CourseLoading)...[
                SizedBox(
                  height: 150,
                  child: Center(
                    child: LoadingAnimationWidget.flickr(
                      leftDotColor: theme.colorScheme.primaryContainer,
                      rightDotColor: theme.colorScheme.errorContainer,
                      size: 30,
                    ),
                  ),
                ),
              ],
              if (state is LastProgressCourseLoaded) ...[
                Text(
                  "Continue Learning",
                  style: theme.textTheme.titleMedium,
                ),
                verticalSpace(6),
                LastProgressItem(
                  course: state.data,
                  onTap: () {
                    context
                        .pushNamed(
                      DetailEnrolledCoursePage.routeName,
                      extra: DetailEnrolledCourseArguments(data: state.data),
                    )
                        .then((value) {
                      context.read<CourseBloc>().add(GetLastProgressCourse(
                          idLastProgressCourse: idLastProgressCourse));
                    });
                  },
                ),
                verticalSpace(24),
              ]
            ],
          ),
        );
      },
    ),
  );
}
