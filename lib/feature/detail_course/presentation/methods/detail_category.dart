import 'package:flutter/material.dart';
import '../../../../common_widget/item/detail_category_item.dart';

Widget detailCategory({
  required List<String> categories,
  required String isSelected,
  required final Function(String title) onTap,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: categories
          .map(
            (data) => GestureDetector(
              onTap: () => onTap(data),
              child: Padding(
                padding: EdgeInsets.only(
                  left: data == categories.first ? 24 : 10,
                  right: data == categories.last ? 24 : 0,
                ),
                child: DetailCategoryItem(
                  isSelected: isSelected == data,
                  title: data,
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
}
