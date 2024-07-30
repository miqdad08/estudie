import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/config/constant/image_constant.dart';

import '../../../common_widget/item/course_category_item.dart';
import '../../../config/theme/app_theme.dart';
import '../../auth/presentation/auth_bloc/auth_bloc.dart';
import '../../detail_course/presentation/detail_course_page.dart';
import '../../detail_teacher/presentation/detail_teacher_page.dart';
import 'course_bloc/course_bloc.dart';
import 'methods/course_category.dart';
import 'methods/last_progress.dart';
import 'methods/list_course.dart';
import 'methods/list_teacher.dart';
import 'methods/search_bar.dart';
import 'methods/user_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "";

  final List<CategoryModel> categories = [
    CategoryModel(
      title: 'Design',
      icon: IconsConstants.icStationery,
    ),
    CategoryModel(
      title: 'Sports',
      icon: IconsConstants.icThropy,
    ),
    CategoryModel(
      title: 'Coding',
      icon: IconsConstants.icCode,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomRefreshIndicator(
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
        onRefresh: () async {
          context.read<CourseBloc>().add(GetCourses());
          context.read<AuthBloc>().add(AuthGetCurrent());
        },
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userInfo(),
                verticalSpace(24),
                searchBar(context),
                verticalSpace(24),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess && state.user.idLastProgressCourse != null) {
                      return Column(
                        children: [
                          lastProgress(context, idLastProgressCourse: state.user.idLastProgressCourse!),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
                courseCategory(
                  categories: categories,
                  isSelected: selectedCategory,
                  onTap: (String title) {
                    setState(() {
                      selectedCategory = title;
                    });
                  },
                ),
                verticalSpace(24),
                listCourse(
                  onTap: (title) {
                    context.goNamed(DetailCoursePage.routeName, extra: title);
                  },
                ),
                verticalSpace(24),
                listTeacher(
                  onTap: (teacher) {
                    context.goNamed(DetailTeacherPage.routeName,
                        extra: teacher);
                  },
                ),
                verticalSpace(100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
