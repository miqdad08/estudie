import 'package:flutter/material.dart';

import '../../../../common_widget/icon/custom_rating_bar.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../course/domain/entities/course.dart';

List<Widget> titleAndRating(Course course) => [
      Container(
        width: 313,
        margin: const EdgeInsets.only(
          left: 24,
          right: 56,
        ),
        child: Text(
          course.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: 24,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          children: [
            CustomRatingBar(
              initialRating: course.rating,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                bottom: 2,
              ),
              child: Text(
                "${course.rating}/5",
                style: theme.textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    ];
