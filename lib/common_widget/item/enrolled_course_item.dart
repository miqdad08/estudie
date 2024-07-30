import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';
import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';

import '../../common_util/size/methods.dart';
import '../../config/constant/image_constant.dart';
import '../../config/theme/app_theme.dart';

class EnrolledCourseItem extends StatelessWidget {
  final EnrolledCourseEntity course;
  final VoidCallback? onTap;

  const EnrolledCourseItem({super.key, required this.course, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.width / 2.5,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme.colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageWidget(
              width: 100,
              height: 150,
              radius: BorderRadius.circular(12),
              imagePath: course.posterPath,
              fit: BoxFit.cover,
            ),
            horizontalSpace(10),
            _buildTitleAndDescription(),
          ],
        ),
      ),
    );
  }

  Expanded _buildTitleAndDescription() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium,
          ),
          Expanded(
            child: Text(
              course.category,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 8,
            child: LinearProgressIndicator(
              value: course.progress! / course.lessons.length,
              minHeight: 1,
              borderRadius: BorderRadius.circular(6),
              backgroundColor: theme.colorScheme.onPrimary,
              valueColor: AlwaysStoppedAnimation<Color>(
                theme.colorScheme.primaryContainer,
              ),
            ),
          ),
          verticalSpace(2),
          Text(
            "${((course.progress! / course.lessons.length) * 100).round()}% Completed",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(2),
        ],
      ),
    );
  }
}
