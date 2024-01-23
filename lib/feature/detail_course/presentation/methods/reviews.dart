import 'package:flutter/material.dart';
import '../../../../common_util/size/methods.dart';
import '../../../../common_widget/button/custom_button.dart';
import '../../../../common_widget/item/review_item.dart';
import '../../../../common_widget/modal/modal_create_review.dart';
import '../../domain/entities/review.dart';

Widget reviews(
  BuildContext context, {
  required List<Review> reviews,
  required TextEditingController reviewCont,
  required TextEditingController rateCont,
  required Function() onSubmit,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomButtonWidget(
            title: 'Add review',
            onPressed: () async {
              ModalCreateReview.show(
                context,
                rateCont: rateCont,
                onSubmit: onSubmit,
                reviewCont: reviewCont,
              );
            },
          ),
          verticalSpace(10),
          ...(reviews..sort((a, b) => -a.time.compareTo(b.time))).map(
            (review) => Padding(
              padding: EdgeInsets.only(
                bottom: review == reviews.last ? 6 : 16,
              ),
              child: ReviewItem(
                review: review,
              ),
            ),
          )
        ],
      ),
    );
