import 'package:flutter/material.dart';
import '../../../../common_util/size/methods.dart';
import '../../../../common_widget/item/course_category_item.dart';
import '../../../../config/theme/app_theme.dart';

Widget courseCategory({
  required List<CategoryModel> categories,
  required String isSelected,
  required final Function(String title) onTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          "Browse Topics",
          style: theme.textTheme.titleMedium,
        ),
      ),
      verticalSpace(6),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories
              .map(
                (data) => GestureDetector(
                  onTap: ()=>onTap(data.title),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: data == categories.first ? 24 : 10,
                      right: data == categories.last ? 24 : 0,
                    ),
                    child: CategoryItem(
                      data: data,
                      isSelected: isSelected == data.title,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    ],
  );
}
