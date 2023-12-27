import 'package:flutter/material.dart';

import '../../../../common_widget/image/custom_image.dart';
import '../../../../config/constant/image_constant.dart';
import '../../../../config/theme/app_decoration.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../../config/theme/custom_text_style.dart';

Widget imageBanner(BuildContext context) {
  return SizedBox(
    height: 280,
    width: 342,
    child: Stack(
      alignment: Alignment.topLeft,
      children: [
        CustomImageWidget(
          imagePath: ImageConstant.imgWelcomePage,
          height: 280,
          width: 230,
          radius: BorderRadius.circular(40),
          alignment: Alignment.center,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 34),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
            decoration: AppDecoration.outlineBlack.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder22,
            ),
            child: Text(
              "👩‍💻 💼 🫰🏻",
              style: theme.textTheme.headlineSmall,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: const EdgeInsets.only(bottom: 60),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: AppDecoration.outlineBlack.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder22,
            ),
            child: Text(
              "Great\nTeachers",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleMediumBold.copyWith(
                height: 1.14,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}