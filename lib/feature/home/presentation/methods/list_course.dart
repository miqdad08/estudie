import 'package:flutter/material.dart';
import '../../../../common_util/size/methods.dart';
import '../../../../common_widget/item/course_item.dart';
import '../../../../config/theme/app_theme.dart';
import '../../domain/entities/course.dart';

Widget listCourse({
  required List<Course> courses,
  required final Function(String title) onTap,
}) {
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
          children: courses
              .map(
                (data) => GestureDetector(
                  onTap: () => onTap(data.title),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: data == courses.first ? 24 : 18,
                      right: data == courses.last ? 24 : 0,
                    ),
                    child: CourseItem(
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
