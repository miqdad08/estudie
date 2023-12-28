import 'package:flutter/material.dart';
import 'package:online_course_app/common_util/size/methods.dart';
import 'package:online_course_app/config/theme/app_theme.dart';

import '../image/custom_image.dart';

class BottomNavBarItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final String title;
  final String image;

  const BottomNavBarItem({
    super.key,
    required this.index,
    required this.isSelected,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageWidget(
          imagePath: image,
          alignment: Alignment.center,
          color: isSelected
              ? theme.colorScheme.onPrimaryContainer.withOpacity(1)
              : theme.colorScheme.onPrimary,
        ),
        verticalSpace(5),
        Text(
          title,
          style: theme.textTheme.labelLarge?.copyWith(
            color : isSelected
                ? theme.colorScheme.onPrimaryContainer.withOpacity(1)
                : theme.colorScheme.onPrimary,
          ),
        )
      ],
    );
  }
}
