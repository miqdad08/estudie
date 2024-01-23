import 'package:flutter/material.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';

import '../../config/theme/app_theme.dart';
import '../../feature/course/domain/entities/teacher.dart';

class TeacherItem extends StatelessWidget {
  final Teacher teacher;

  const TeacherItem({
    Key? key,
    required this.teacher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.colorScheme.errorContainer,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: CustomImageWidget(
              radius: BorderRadius.circular(100),
              imagePath: teacher.photoUrl,
              width: 45,
              height: 45,
            ),
          ),
          verticalSpace(13),
          Text(
            teacher.name,
            style: theme.textTheme.titleMedium!.copyWith(
              fontSize: 18,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            teacher.specialist,
            style: theme.textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
