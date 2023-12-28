import 'package:flutter/material.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/config/constant/image_constant.dart';
import 'package:online_course_app/feature/home/domain/entities/teacher.dart';
import 'package:online_course_app/feature/home/presentation/methods/list_course.dart';

import '../../../common_widget/item/course_category_item.dart';
import '../domain/entities/course.dart';
import 'methods/course_category.dart';
import 'methods/last_progress.dart';
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

  final List<Course> courses = [
    Course(
      id: 1,
      title: 'Full-Stack Mobile App Developer',
      category: 'Coding',
      rating: 4,
      posterPath: ImageConstant.imgPlaceholder,
    ),
    Course(
      id: 1,
      title: 'Design Thinking: Improve Startups Better 100x',
      category: 'Design',
      rating: 3,
      posterPath: ImageConstant.imgPlaceholder,
    ),
    Course(
      id: 1,
      title: 'Analyze UX for Digital Marketing',
      category: 'Design',
      rating: 4,
      posterPath: ImageConstant.imgPlaceholder,
    ),
  ];

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

  final List<Teacher> teachers = [
    Teacher(
      name: 'Bejo Urang',
      email: '-',
      specialist: 'Manager',
      photoUrl: ImageConstant.imgPlaceholder,
    ),
    Teacher(
      name: 'Nek Tua',
      email: '-',
      specialist: 'Manager',
      photoUrl: ImageConstant.imgPlaceholder,
    ),
    Teacher(
      name: 'Mas Coki',
      email: '-',
      specialist: 'Manager',
      photoUrl: ImageConstant.imgPlaceholder,
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
                  print(title);
                  setState(() {
                    selectedCategory = title;
                  });
                },
              ),
              verticalSpace(24),
              listCourse(
                courses: courses,
                onTap: (title) {},
              ),
              verticalSpace(24),
              listTeacher(
                teachers: teachers,
                onTap: (String name) {},
              ),
              verticalSpace(100),
            ],
          ),
        ],
      ),
    );
  }
}
