import 'package:flutter/material.dart';

import '../../config/theme/app_decoration.dart';
import '../../config/theme/app_theme.dart';

class DetailCategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const DetailCategoryItem({
    super.key,
    required this.isSelected,
    required this.title,
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
      child: Text(
        title,
        style: theme.textTheme.titleMedium,
      ),
    );
  }
}