import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/config/constant/image_constant.dart';

import '../../../common_widget/item/course_category_item.dart';
import '../../detail_course/presentation/detail_course_page.dart';
import '../../detail_teacher/presentation/detail_teacher_page.dart';
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
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userInfo(),
              verticalSpace(24),
              searchBar(context),
              verticalSpace(24),
              lastProgress(context),
              verticalSpace(24),
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
                  context.goNamed(DetailTeacherPage.routeName, extra: teacher);
                },
              ),
              verticalSpace(100),
            ],
          ),
        ],
      ),
    );
  }
}
