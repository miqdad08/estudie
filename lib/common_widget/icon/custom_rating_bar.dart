import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../config/constant/image_constant.dart';
import '../../config/theme/app_theme.dart';
import '../image/custom_image.dart';

class CustomRatingBar extends StatelessWidget {
  CustomRatingBar({
    Key? key,
    this.alignment,
    this.ignoreGestures,
    this.initialRating,
    this.itemSize,
    this.itemCount,
    this.color,
    this.unselectedColor,
    this.onRatingUpdate,
    this.allowHalfRating = true,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final bool? ignoreGestures;

  final double? initialRating;

  final double? itemSize;

  final int? itemCount;

  final Color? color;

  final Color? unselectedColor;

  Function(double)? onRatingUpdate;

  bool allowHalfRating;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: ratingBarWidget,
          )
        : ratingBarWidget;
  }

  Widget get ratingBarWidget => RatingBar.builder(
        ignoreGestures: ignoreGestures ?? false,
        initialRating: initialRating ?? 0,
        minRating: 0,
        direction: Axis.horizontal,
        allowHalfRating: allowHalfRating,
        itemSize: itemSize ?? 24,
        unratedColor: unselectedColor ?? theme.colorScheme.onPrimary,
        itemCount: itemCount ?? 5,
        updateOnDrag: true,
        itemPadding: const EdgeInsets.only(right: 4.0),
        itemBuilder: (
          context,
          _,
        ) {
          return CustomImageWidget(
            imagePath: IconsConstants.icRating,
          );
        },
        onRatingUpdate: (rating) {
          onRatingUpdate!.call(rating);
        },
      );
}
