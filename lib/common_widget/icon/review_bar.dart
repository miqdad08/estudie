import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';
import 'package:online_course_app/config/constant/image_constant.dart';

import '../../config/theme/app_theme.dart';


class ReviewBar extends StatelessWidget {
  final int rating;
  final int totalRating;
  final int length;

  const ReviewBar({
    super.key,
    required this.rating,
    required this.totalRating,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImageWidget(
            imagePath: IconsConstants.icRating,
            width: 15,
          ),
          Text(
            rating.toString(),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600
            ),
          ),
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(55),
              child: LinearProgressIndicator(
                value: length / totalRating,
                minHeight: 5,
                valueColor: AlwaysStoppedAnimation(appTheme.deepPurpleA700),
                backgroundColor: theme.colorScheme.errorContainer,
              ),
            ),
          ),
          Text(
            length.toString(),
            style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}
