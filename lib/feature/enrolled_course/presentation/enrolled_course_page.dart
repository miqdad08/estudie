import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:online_course_app/common_util/size/methods.dart';

import '../../../common_widget/item/enrolled_course_item.dart';
import '../../../config/theme/app_theme.dart';
import 'bloc/enrolled_course/enrolled_course_bloc.dart';
import 'detail_enrolled_course_page.dart';

class EnrolledCoursePage extends StatelessWidget {
  const EnrolledCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomRefreshIndicator(
          builder: (context, child, controller) {
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                if (!controller.isIdle && controller.value != 0)
                  Positioned(
                    top: 49,
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: LoadingAnimationWidget.flickr(
                        leftDotColor: theme.colorScheme.primaryContainer,
                        rightDotColor: theme.colorScheme.errorContainer,
                        size: 30,
                      ),
                    ),
                  ),
                child,
              ],
            );
          },
          onRefresh: () async{
            context.read<EnrolledCourseBloc>().add(GetEnrolledCourses());
          },
          child: ListView(
            children: [
              Text(
                "Library",
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleLarge,
              ),
              verticalSpace(20),
              BlocBuilder<EnrolledCourseBloc, EnrolledCourseState>(
                bloc: BlocProvider.of<EnrolledCourseBloc>(context)..add(GetEnrolledCourses()),
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
                              child: EnrolledCourseItem(
                                onTap: () {
                                  context.pushNamed(
                                    DetailEnrolledCoursePage.routeName,
                                    extra: DetailEnrolledCourseArguments(
                                        data: data),
                                  ).then((value) {
                                    context.read<EnrolledCourseBloc>().add(GetEnrolledCourses());
                                  });
                                },
                                course: data,
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
