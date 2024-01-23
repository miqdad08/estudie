import 'package:flutter/material.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';

import '../../config/constant/image_constant.dart';
import '../../config/theme/app_decoration.dart';
import '../../config/theme/app_theme.dart';
import '../../config/theme/custom_text_style.dart';
import '../../feature/course/domain/entities/course.dart';

class UpcomingCourseItem extends StatelessWidget {
  final Course course;

  const UpcomingCourseItem({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      decoration: AppDecoration.fillErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageWidget(
            imagePath: course.posterPath,
            height: 160,
            fit: BoxFit.cover,
            width: 230,
            radius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        course.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.titleMediumBold.copyWith(
                          color:
                              theme.colorScheme.onPrimaryContainer.withOpacity(1),
                        ),
                      ),
                    ),
                    horizontalSpace(4),
                    CustomImageWidget(
                      imagePath: IconsConstants.icRating,
                      height: 20,
                      width: 20,
                      margin: const EdgeInsets.only(
                        top: 13,
                        bottom: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 16,
                      ),
                      child: Text(
                        '${course.rating}/5',
                        style: theme.textTheme.titleSmall!.copyWith(
                          color:
                              theme.colorScheme.onPrimaryContainer.withOpacity(1),
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(4),
                Text(
                  course.category,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
