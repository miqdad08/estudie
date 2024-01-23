import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';

import '../../common_util/size/methods.dart';
import '../../config/constant/image_constant.dart';
import '../../config/theme/app_theme.dart';
import '../../feature/course/domain/entities/course.dart';

class CourseItem extends StatelessWidget {
  final Course course;

  const CourseItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

  Expanded _buildTitleAndDescription() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.title + course.title,
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
          Row(
            children: [
              CustomImageWidget(
                imagePath: IconsConstants.icRating,
                height: 20,
                width: 20,
              ),
              horizontalSpace(5),
              Text(
                '${course.rating}/5',
                style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
