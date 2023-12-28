import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/item/teacher_item.dart';
import '../../../../common_util/size/methods.dart';
import '../../../../config/theme/app_theme.dart';
import '../../domain/entities/teacher.dart';

Widget listTeacher({
  required List<Teacher> teachers,
  required final Function(String name) onTap,
}) {
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
          children: teachers
              .map(
                (data) => GestureDetector(
                  onTap: () => onTap(data.name),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: data == teachers.first ? 24 : 18,
                      right: data == teachers.last ? 24 : 0,
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
