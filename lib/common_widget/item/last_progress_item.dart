import 'package:flutter/material.dart';
import 'package:online_course_app/feature/enrolled_course/domain/entities/enrolled_course.dart';

import '../../common_util/size/methods.dart';
import '../../config/constant/image_constant.dart';
import '../../config/theme/app_decoration.dart';
import '../../config/theme/app_theme.dart';
import '../image/custom_image.dart';

class LastProgressItem extends StatelessWidget {
  final EnrolledCourseEntity course;
  final VoidCallback onTap;
  const LastProgressItem({super.key, required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: appTheme.deepPurpleA700,
      borderRadius: BorderRadiusStyle.roundedBorder16,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: AppDecoration.fillErrorContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
          color: theme.colorScheme.errorContainer.withOpacity(0.9),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 188,
                      child: Text(
                        course.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    verticalSpace(2),
                    Text(
                      course.category,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
                CustomImageWidget(
                  imagePath: course.posterPath ?? ImageConstant.imgPlaceholder,
                  height: 80,
                  width: 100,
                  fit: BoxFit.cover,
                  radius: BorderRadius.circular(12),
                  margin: const EdgeInsets.only(bottom: 5),
                ),
              ],
            ),
            verticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: course.progress! / course.lessons.length,
                    minHeight: 12,
                    borderRadius: BorderRadius.circular(6),
                    backgroundColor: theme.colorScheme.onPrimary,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      theme.colorScheme.primaryContainer,
                    ),
                  ),
                ),
                horizontalSpace(10),
                Text(
                  "${course.progress}/${course.lessons.length}",
                  style: theme.textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
