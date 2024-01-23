import 'package:flutter/material.dart';

import '../../common_util/format/format_time.dart';
import '../../common_util/size/methods.dart';
import '../../config/theme/app_decoration.dart';
import '../../config/theme/app_theme.dart';
import '../../feature/detail_course/domain/entities/review.dart';
import '../icon/custom_rating_bar.dart';

class ReviewItem extends StatelessWidget {
  final Review review;

  const ReviewItem({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      decoration: AppDecoration.fillErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            review.nameUser ?? '-',
            style: theme.textTheme.titleMedium,
          ),
          verticalSpace(3),
          Row(
            children: [
              CustomRatingBar(
                initialRating: review.rating,
                itemSize: 15,
              ),
              horizontalSpace(3),
              Text(
                formatTimeAgo(review.time),
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer.withOpacity(0.8),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          verticalSpace(3),
          Text(
            review.review,
            style: theme.textTheme.titleSmall
                ?.copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
