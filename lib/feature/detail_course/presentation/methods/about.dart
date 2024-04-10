import 'package:flutter/material.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/feature/detail_course/domain/entities/detail_course.dart';

import '../../../../common_widget/icon/custom_rating_bar.dart';
import '../../../../common_widget/icon/review_bar.dart';
import '../../../../common_widget/text/rich_text_widget.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../course/domain/entities/course.dart';
import '../../../detail_teacher/presentation/methods/teacher_info.dart';
import '../../domain/entities/review.dart';

Widget about({
  required DetailCourse detailCourse,
  required Course course,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detailCourse.about!,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          verticalSpace(24),
          Text(
            'Instructors',
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          teacherInfo(detailCourse.teacher),
          verticalSpace(24),
          Text(
            'Rating',
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichTextWidget(
                      richTextList: [
                        RichTextModel(
                          text: '${findMajorityRating(detailCourse.reviews)}',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        RichTextModel(
                          text: ' / 5.0',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    CustomRatingBar(
                      initialRating: course.rating,
                      itemSize: 18,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${detailCourse.reviews.length} Rating',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    5,
                    (index) => ReviewBar(
                      rating: 5 - index,
                      length: detailCourse.reviews
                          .where(
                              (review) => review.rating.toInt() == (5 - index))
                          .length,
                      totalRating: detailCourse.reviews.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

double findMajorityRating(List<Review> reviews) {
  Map<double, int> ratingCounts = {};

  for (var review in reviews) {
    ratingCounts.update(review.rating, (value) => value + 1, ifAbsent: () => 1);
  }

  double majorityRating =
      ratingCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;

  return majorityRating > 5.0 ? 5.0 : majorityRating;
}
