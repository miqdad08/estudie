import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/feature/course/domain/entities/teacher.dart';

import '../../../common_widget/appbar/appbar_widget.dart';
import '../../course/domain/entities/course.dart';
import 'methods/list_course.dart';
import 'methods/teacher_info.dart';

class DetailTeacherPage extends StatelessWidget {
  final Teacher teacher;
  static const String routeName = 'detail_teacher_page';

  const DetailTeacherPage({
    super.key,
    required this.teacher,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Teacher Detail',
        onTap: () => context.pop(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          teacherInfo(teacher),
          verticalSpace(24),
          listCourse(
            onTap: (Course title) {},
            teacher: teacher,
          ),
        ],
      ),
    );
  }
}
