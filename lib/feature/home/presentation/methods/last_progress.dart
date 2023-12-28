import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';

import '../../../../common_util/size/methods.dart';
import '../../../../config/constant/image_constant.dart';
import '../../../../config/theme/app_decoration.dart';
import '../../../../config/theme/app_theme.dart';

Widget lastProgress(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Continue Learning",
          style: theme.textTheme.titleMedium,
        ),
        verticalSpace(6),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          decoration: AppDecoration.fillErrorContainer.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 188,
                        child: Text(
                          "Mastering Figma Auto Layout",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      verticalSpace(2),
                      Text(
                        "UI/UX Design",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  CustomImageWidget(
                    imagePath: ImageConstant.imgPlaceholder,
                    height: 80,
                    width: 100,
                    radius: BorderRadius.circular(12),
                    margin: const EdgeInsets.only(bottom: 5),
                  ),
                ],
              ),
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0.55,
                      minHeight: 12,
                      borderRadius: BorderRadius.circular(6),
                      backgroundColor: theme.colorScheme.onPrimary,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                  horizontalSpace(10),
                  Text(
                    "11/69",
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
