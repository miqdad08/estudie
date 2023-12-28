import 'package:flutter/material.dart';
import 'package:online_course_app/common_widget/image/custom_image.dart';
import 'package:online_course_app/config/constant/image_constant.dart';
import 'package:online_course_app/config/theme/app_theme.dart';

import '../../../../common_util/size/methods.dart';
import '../../../../common_widget/icon/custom_icon_button.dart';
import '../../../../config/theme/app_decoration.dart';

Widget userInfo() => Padding(
  padding: const EdgeInsets.fromLTRB(25, 2, 24, 0),
  child: Row(
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        width: 70,
        height: 70,
        decoration: AppDecoration.fillErrorContainer.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder35,
        ),
        child: CustomImageWidget(
          radius: BorderRadius.circular(100),
          imagePath: ImageConstant.imgPlaceholder,
        ),
      ),
      horizontalSpace(16),
      Text(
        '${getGreeting()}\nmiqdad!',
        style: theme.textTheme.titleMedium?.copyWith(
          fontSize: 18,
        )
      ),
      const Spacer(),
      CustomIconButton(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 55,
        width: 55,
        child: CustomImageWidget(
          imagePath: IconsConstants.icNotif,
        ),
      ),
    ],
  ),
);

String getGreeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 18) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}
