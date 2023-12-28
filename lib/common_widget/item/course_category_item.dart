import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';

import '../../config/theme/app_decoration.dart';
import '../../config/theme/app_theme.dart';

class CourseCategoryItem extends StatelessWidget {
  final CategoryModel data;
  final bool isSelected;

  const CourseCategoryItem({
    super.key,
    required this.data,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      decoration: AppDecoration.fillDeepPurpleA.copyWith(
        color: isSelected
            ? appTheme.deepPurpleA700
            : theme.colorScheme.errorContainer,
        borderRadius: BorderRadiusStyle.circleBorder27,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageWidget(
            imagePath: data.icon,
            height: 24,
            width: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 1,
            ),
            child: Text(
              data.title,
              style: theme.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryModel {
  final String title;
  final String icon;

  CategoryModel({
    required this.title,
    required this.icon,
  });
}
