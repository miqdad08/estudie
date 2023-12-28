import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';

import '../../../../config/constant/image_constant.dart';
import '../../../../config/theme/app_theme.dart';

Widget searchBar(BuildContext context) => Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 24 - 24,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: theme.colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(100)),
          child: TextFormField(
            style: theme.textTheme.bodyLarge,
            decoration: InputDecoration(
              hintStyle: theme.textTheme.bodyLarge,
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 52,
              ),
              prefixIcon:  Container(
                margin: EdgeInsets.only(right: 16),
                child: CustomImageWidget(
                  imagePath: IconsConstants.icSearch,
                  height: 24,
                  width: 24,
                ),
              ),
              hintText: 'Search by skills or teacher',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
